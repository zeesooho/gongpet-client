import 'package:freezed_annotation/freezed_annotation.dart';

part 'sido_item.freezed.dart';
part 'sido_item.g.dart';

@freezed
class SidoItem with _$SidoItem {
  factory SidoItem({
    required String orgCd,
    required String orgdownNm,
  }) = _SidoItem;

  factory SidoItem.fromJson(Map<String, dynamic> json) => _$SidoItemFromJson(json);
}
