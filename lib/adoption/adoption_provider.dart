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
  }

  Future<void> loadSigungu(String uprCd) async {
    if (state.sigunguMap.containsKey(uprCd)) return;
    state = state.copyWith(isLoading: true);
    final sigungus = await _apiClient.getSigungu(uprCd);
    state = state.copyWith(
      sigunguMap: {...state.sigunguMap, uprCd: sigungus},
      isLoading: false,
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
    final newDogs = await _apiClient.getStrayDogs(
      state.filter.toJson(),
      pageNo: newPage.toString(),
      numOfRows: '10',
    );
    state = state.copyWith(
      strayDogs: refresh ? newDogs : [...state.strayDogs, ...newDogs],
      isLoading: false,
      currentPage: newPage + 1,
    );
  }

  void updateFilter(SearchFilter newFilter) {
    state = state.copyWith(filter: newFilter);
    loadStrayDogs(refresh: true);
  }
}
