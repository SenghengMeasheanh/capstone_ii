// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_pages_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaticPagesModels _$StaticPagesModelsFromJson(Map<String, dynamic> json) =>
    StaticPagesModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      alias: json['alias'] as String,
      contentEn: json['content_en'] as String,
      contentKh: json['content_kh'] as String,
      isActive: (json['is_active'] as num).toInt(),
    );

Map<String, dynamic> _$StaticPagesModelsToJson(StaticPagesModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'alias': instance.alias,
      'content_en': instance.contentEn,
      'content_kh': instance.contentKh,
      'is_active': instance.isActive,
    };
