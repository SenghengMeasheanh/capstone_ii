// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_major_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityMajorModels _$UniversityMajorModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityMajorModels(
      id: (json['id'] as num).toInt(),
      isActive: (json['is_active'] as num).toInt(),
      majorName:
          MajorModels.fromJson(json['major_name'] as Map<String, dynamic>),
      majorImage: json['major_image'] as String,
    );

Map<String, dynamic> _$UniversityMajorModelsToJson(
        UniversityMajorModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isActive,
      'major_name': instance.majorName,
      'major_image': instance.majorImage,
    };
