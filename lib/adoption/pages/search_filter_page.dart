import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/adoption/adoption_provider.dart';
import 'package:gongpet/adoption/models/search_filter.dart';
import 'package:gongpet/adoption/models/sigungu_item.dart';

class SearchFilterPage extends ConsumerStatefulWidget {
  @override
  _SearchFilterPageState createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends ConsumerState<SearchFilterPage> {
  late SearchFilter _filter;
  final TextEditingController _bgndeController = TextEditingController();
  final TextEditingController _enddeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filter = ref.read(adoptionStateProvider).filter;
    _bgndeController.text = _filter.bgnde ?? '';
    _enddeController.text = _filter.endde ?? '';
  }

  @override
  void dispose() {
    _bgndeController.dispose();
    _enddeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adoptionState = ref.watch(adoptionStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text('검색 필터')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // 시/도 선택
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
          SizedBox(height: 16),

          // 시/군/구 선택
          if (_filter.uprCd != null) _buildSigunguDropdown(adoptionState.sigunguMap),

          SizedBox(height: 16),

          // 품종 선택 (품종 API 연동 필요)
          // TODO: 품종 API 연동 후 구현

          // 검색 시작일
          TextFormField(
            controller: _bgndeController,
            decoration: InputDecoration(
              labelText: '검색 시작일',
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context, true),
              ),
            ),
            readOnly: true,
          ),
          SizedBox(height: 16),

          // 검색 종료일
          TextFormField(
            controller: _enddeController,
            decoration: InputDecoration(
              labelText: '검색 종료일',
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context, false),
              ),
            ),
            readOnly: true,
          ),
          SizedBox(height: 16),

          // 상태 선택
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '상태'),
            value: _filter.state,
            items: [
              DropdownMenuItem(value: null, child: Text('전체')),
              DropdownMenuItem(value: 'notice', child: Text('공고중')),
              DropdownMenuItem(value: 'protect', child: Text('보호중')),
            ],
            onChanged: (value) {
              setState(() {
                _filter = _filter.copyWith(state: value);
              });
            },
          ),
          SizedBox(height: 16),

          // 중성화 여부
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: '중성화 여부'),
            value: _filter.neuterYn,
            items: [
              DropdownMenuItem(value: null, child: Text('전체')),
              DropdownMenuItem(value: 'Y', child: Text('예')),
              DropdownMenuItem(value: 'N', child: Text('아니오')),
              DropdownMenuItem(value: 'U', child: Text('미상')),
            ],
            onChanged: (value) {
              setState(() {
                _filter = _filter.copyWith(neuterYn: value);
              });
            },
          ),
          SizedBox(height: 24),

          ElevatedButton(
            child: Text('검색'),
            onPressed: () {
              ref.read(adoptionStateProvider.notifier).updateFilter(_filter);
              ref.read(adoptionStateProvider.notifier).applyFilter();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      String formattedDate = '${picked.year}${picked.month.toString().padLeft(2, '0')}${picked.day.toString().padLeft(2, '0')}';

      setState(() {
        if (isStartDate) {
          _bgndeController.text = formattedDate;
          _filter = _filter.copyWith(bgnde: formattedDate);
        } else {
          _enddeController.text = formattedDate;
          _filter = _filter.copyWith(endde: formattedDate);
        }
      });
    }
  }

  Widget _buildSigunguDropdown(Map<String, List<SigunguItem>> sigunguMap) {
    // 현재 선택된 시/도에 해당하는 시/군/구 목록
    final sigunguList = sigunguMap[_filter.uprCd] ?? [];

    // 시/군/구 목록이 비어있거나 로딩 중이면 드롭다운을 표시하지 않음
    if (sigunguList.isEmpty) {
      return SizedBox.shrink();
    }

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: '시/군/구'),
      value: null, // 항상 null로 시작
      hint: Text('시/군/구 선택'),
      items: sigunguList
          .map((sigungu) => DropdownMenuItem(
                value: sigungu.orgCd,
                child: Text(sigungu.orgdownNm),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _filter = _filter.copyWith(orgCd: value);
        });
        ref.read(adoptionStateProvider.notifier).updateFilter(_filter);
      },
    );
  }
}
