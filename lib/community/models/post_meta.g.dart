// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostMetaImpl _$$PostMetaImplFromJson(Map<String, dynamic> json) =>
    _$PostMetaImpl(
      views: (json['views'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      commentsCount: (json['commentsCount'] as num).toInt(),
    );

Map<String, dynamic> _$$PostMetaImplToJson(_$PostMetaImpl instance) =>
    <String, dynamic>{
      'views': instance.views,
      'likes': instance.likes,
      'commentsCount': instance.commentsCount,
    };
