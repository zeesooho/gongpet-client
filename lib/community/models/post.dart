import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gongpet/community/models/post_comment.dart';
import 'package:gongpet/community/models/post_meta.dart';
import 'package:gongpet/community/models/post_user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required int id,
    required String title,
    required String content,
    required String createdAt,
    required PostUser user,
    required int categoryId,
    required PostMeta postMeta,
    List<PostComment>? comments,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
