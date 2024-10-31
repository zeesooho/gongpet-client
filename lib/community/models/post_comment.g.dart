// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostCommentImpl _$$PostCommentImplFromJson(Map<String, dynamic> json) =>
    _$PostCommentImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      likes: (json['likes'] as num).toInt(),
      user: PostUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostCommentImplToJson(_$PostCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'likes': instance.likes,
      'user': instance.user,
    };
