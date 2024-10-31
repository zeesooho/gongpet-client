import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gongpet/community/models/post.dart';

part 'post_response.freezed.dart';

@freezed
class PostResponse with _$PostResponse {
  factory PostResponse({
    required List<Post> posts,
    required int total,
    required int currentPage,
    required int totalPages,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      posts: (json['posts'] as List).map((e) => Post.fromJson(e as Map<String, dynamic>)).toList(),
      total: json['total'] as int,
      currentPage: json['currentPage'] as int,
      totalPages: json['totalPages'] as int,
    );
  }
}
