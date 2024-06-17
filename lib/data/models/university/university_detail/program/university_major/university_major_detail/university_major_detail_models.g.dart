// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_major_detail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityMajorDetailModels _$UniversityMajorDetailModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityMajorDetailModels(
      id: (json['id'] as num).toInt(),
      descriptionEn: json['description_en'] as String,
      descriptionKh: json['description_kh'] as String,
      curriculumUrl: json['curriculum_url'] as String,
    );

Map<String, dynamic> _$UniversityMajorDetailModelsToJson(
        UniversityMajorDetailModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description_en': instance.descriptionEn,
      'description_kh': instance.descriptionKh,
      'curriculum_url': instance.curriculumUrl,
    };
