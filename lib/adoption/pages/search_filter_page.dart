import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/adoption/adoption_provider.dart';
import '../models/search_filter.dart';

class SearchFilterPage extends ConsumerStatefulWidget {
  @override
  _SearchFilterPageState createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends ConsumerState<SearchFilterPage> {
  late SearchFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = ref.read(adoptionStateProvider).filter;
  }

  @override
  Widget build(BuildContext context) {
    final adoptionState = ref.watch(adoptionStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text('검색 필터')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '시/도'),
            value: _filter.uprCd,
            items: adoptionState.sidos
                .map((sido) => DropdownMenuItem(
                      value: sido.orgCd,
                      child: Text(sido.orgdownNm),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _filter = _filter.copyWith(uprCd: value, orgCd: null);
              });
              if (value != null) {
                ref.read(adoptionStateProvider.notifier).loadSigungu(value);
              }
            },
          ),
          if (_filter.uprCd != null)
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: '시/군/구'),
              value: _filter.orgCd,
              items: (adoptionState.sigunguMap[_filter.uprCd] ?? [])
                  .map((sigungu) => DropdownMenuItem(
                        value: sigungu.orgCd,
                        child: Text(sigungu.orgdownNm),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(orgCd: value);
                });
              },
            ),
          // 여기에 추가 필터 옵션들을 구현할 수 있습니다.
          ElevatedButton(
            child: Text('검색'),
            onPressed: () {
              Navigator.pop(context, _filter);
            },
          ),
        ],
      ),
    );
  }
}
