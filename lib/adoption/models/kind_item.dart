import 'package:freezed_annotation/freezed_annotation.dart';

part 'kind_item.freezed.dart';
part 'kind_item.g.dart';

@freezed
class KindItem with _$KindItem {
  factory KindItem({
    required String kindCd,
    required String knm,
  }) = _KindItem;

  factory KindItem.fromJson(Map<String, dynamic> json) => _$KindItemFromJson(json);
}
