// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostCategoryImpl _$$PostCategoryImplFromJson(Map<String, dynamic> json) =>
    _$PostCategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String,
      hasLabel: json['hasLabel'] as bool,
      labels: (json['labels'] as List<dynamic>)
          .map((e) => CategoryLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$PostCategoryImplToJson(_$PostCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'hasLabel': instance.hasLabel,
      'labels': instance.labels,
      'description': instance.description,
    };
