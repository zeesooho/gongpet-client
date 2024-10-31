import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigungu_item.freezed.dart';
part 'sigungu_item.g.dart';

@freezed
class SigunguItem with _$SigunguItem {
  factory SigunguItem({
    required String uprCd,
    required String orgCd,
    required String orgdownNm,
  }) = _SigunguItem;

  factory SigunguItem.fromJson(Map<String, dynamic> json) => _$SigunguItemFromJson(json);
}
