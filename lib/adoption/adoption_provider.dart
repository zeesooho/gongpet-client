import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/adoption/models/kind_item.dart';
import 'package:gongpet/adoption/models/sido_item.dart';
import 'package:gongpet/adoption/models/sigungu_item.dart';
import 'package:gongpet/adoption/models/stray_dog.dart';
import 'package:gongpet/adoption/models/search_filter.dart';

import 'adoption_api_client.dart';

final adoptionStateProvider = StateNotifierProvider<AdoptionStateNotifier, AdoptionState>((ref) {
  return AdoptionStateNotifier(ref.watch(adoptionApiClientProvider));
});

class AdoptionState {
  final List<SidoItem> sidos;
  final Map<String, List<SigunguItem>> sigunguMap;
  final Map<String, List<KindItem>> kindMap;
  final List<StrayDog> strayDogs;
  final SearchFilter filter;
  final int currentPage;
  final bool isLoading;

  AdoptionState({
    this.sidos = const [],
    this.sigunguMap = const {},
    this.kindMap = const {},
    this.strayDogs = const [],
    this.filter = const SearchFilter(),
    this.currentPage = 1,
    this.isLoading = false,
  });

  AdoptionState copyWith({
    List<SidoItem>? sidos,
    Map<String, List<SigunguItem>>? sigunguMap,
    Map<String, List<KindItem>>? kindMap,
    List<StrayDog>? strayDogs,
    SearchFilter? filter,
    int? currentPage,
    bool? isLoading,
  }) {
    return AdoptionState(
      sidos: sidos ?? this.sidos,
      sigunguMap: sigunguMap ?? this.sigunguMap,
      kindMap: kindMap ?? this.kindMap,
      strayDogs: strayDogs ?? this.strayDogs,
      filter: filter ?? this.filter,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AdoptionStateNotifier extends StateNotifier<AdoptionState> {
  final AdoptionApiClient _apiClient;

  AdoptionStateNotifier(this._apiClient) : super(AdoptionState()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = state.copyWith(isLoading: true);
    final sidos = await _apiClient.getSido();
    state = state.copyWith(sidos: sidos, isLoading: false);
    loadStrayDogs(refresh: true);
  }

  Future<void> loadSigungu(String uprCd) async {
    state = state.copyWith(sigunguMap: {}, isLoading: true);

    try {
      final sigungus = await _apiClient.getSigungu(uprCd);
      state = state.copyWith(
        sigunguMap: {uprCd: sigungus},
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        sigunguMap: {},
        isLoading: false,
      );
    }
  }

  void updateFilter(SearchFilter newFilter) {
    state = state.copyWith(
      filter: newFilter,
      strayDogs: [],
      currentPage: 1,
    );
  }

  Future<void> loadKind(String upKindCd) async {
    if (state.kindMap.containsKey(upKindCd)) return;
    state = state.copyWith(isLoading: true);
    final kinds = await _apiClient.getKind(upKindCd);
    state = state.copyWith(
      kindMap: {...state.kindMap, upKindCd: kinds},
      isLoading: false,
    );
  }

  Future<void> loadStrayDogs({bool refresh = false}) async {
    final newPage = refresh ? 1 : state.currentPage;
    state = state.copyWith(isLoading: true, currentPage: newPage);

    try {
      final filter = state.filter;
      final newDogs = await _apiClient.getStrayDogs(
        filter.toJson(),
        pageNo: newPage.toString(),
        numOfRows: '10',
        state: filter.state,
        bgnde: filter.bgnde,
        endde: filter.endde,
        uprCd: filter.uprCd,
        orgCd: filter.orgCd,
        careRegNo: filter.careRegNo,
        kind: filter.kind,
        neuterYn: filter.neuterYn,
      );

      state = state.copyWith(
        strayDogs: refresh ? newDogs : [...state.strayDogs, ...newDogs],
        isLoading: false,
        currentPage: newPage + 1,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> applyFilter() async {
    state = state.copyWith(isLoading: true, strayDogs: [], currentPage: 1);
    await loadStrayDogs(refresh: true);
  }

  void clearSigungu(String uprCd) {
    state = state.copyWith(
      sigunguMap: {...state.sigunguMap}..remove(uprCd),
      filter: state.filter.copyWith(orgCd: null),
    );
  }
}
