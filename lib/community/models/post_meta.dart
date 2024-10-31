import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_meta.freezed.dart';
part 'post_meta.g.dart';

@freezed
class PostMeta with _$PostMeta {
  factory PostMeta({
    required int views,
    required int likes,
    required int commentsCount,
  }) = _PostMeta;

  factory PostMeta.fromJson(Map<String, dynamic> json) => _$PostMetaFromJson(json);
}
