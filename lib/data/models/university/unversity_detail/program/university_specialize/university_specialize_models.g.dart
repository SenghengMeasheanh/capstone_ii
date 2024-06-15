// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_specialize_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversitySpecializeModels _$UniversitySpecializeModelsFromJson(
        Map<String, dynamic> json) =>
    UniversitySpecializeModels(
      id: (json['id'] as num).toInt(),
      isActive: (json['is_active'] as num).toInt(),
      specializeName: SpecializeName.fromJson(
          json['specialize_name'] as Map<String, dynamic>),
      specializeImage: json['specialize_image'] as String,
    );

Map<String, dynamic> _$UniversitySpecializeModelsToJson(
        UniversitySpecializeModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isActive,
      'specialize_name': instance.specializeName,
      'specialize_image': instance.specializeImage,
    };

SpecializeName _$SpecializeNameFromJson(Map<String, dynamic> json) =>
    SpecializeName(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
    );

Map<String, dynamic> _$SpecializeNameToJson(SpecializeName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
    };
