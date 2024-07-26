// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_category_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCategoryModels _$EventCategoryModelsFromJson(Map<String, dynamic> json) =>
    EventCategoryModels(
      id: (json['id'] as num).toInt(),
      nameKh: json['name_kh'] as String,
      nameEn: json['name_en'] as String,
      isActive: (json['is_active'] as num).toInt(),
    );

Map<String, dynamic> _$EventCategoryModelsToJson(
        EventCategoryModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_kh': instance.nameKh,
      'name_en': instance.nameEn,
      'is_active': instance.isActive,
    };
