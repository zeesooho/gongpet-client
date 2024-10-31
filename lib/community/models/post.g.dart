// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      user: PostUser.fromJson(json['user'] as Map<String, dynamic>),
      categoryId: (json['categoryId'] as num).toInt(),
      postMeta: PostMeta.fromJson(json['postMeta'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => PostComment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'user': instance.user,
      'categoryId': instance.categoryId,
      'postMeta': instance.postMeta,
      'comments': instance.comments,
    };
