import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gongpet/community/models/category_label.dart';

part 'post_category.freezed.dart';
part 'post_category.g.dart';

@freezed
class PostCategory with _$PostCategory {
  factory PostCategory({
    required int id,
    required String name,
    required String abbreviation,
    required bool hasLabel,
    required List<CategoryLabel> labels,
    required String description,
  }) = _PostCategory;

  factory PostCategory.fromJson(Map<String, dynamic> json) => _$PostCategoryFromJson(json);
}
