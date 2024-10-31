import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gongpet/community/models/post_user.dart';

part 'post_comment.freezed.dart';
part 'post_comment.g.dart';

@freezed
class PostComment with _$PostComment {
  factory PostComment({
    required int id,
    required String content,
    required String createdAt,
    required int likes,
    required PostUser user,
  }) = _PostComment;

  factory PostComment.fromJson(Map<String, dynamic> json) => _$PostCommentFromJson(json);
}
