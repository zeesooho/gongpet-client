import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_label.freezed.dart';
part 'category_label.g.dart';

@freezed
class CategoryLabel with _$CategoryLabel {
  factory CategoryLabel({
    required int id,
    required String name,
  }) = _CategoryLabel;

  factory CategoryLabel.fromJson(Map<String, dynamic> json) => _$CategoryLabelFromJson(json);
}
