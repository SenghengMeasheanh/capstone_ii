// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityModels _$UniversityModelsFromJson(Map<String, dynamic> json) =>
    UniversityModels(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      graduationRate: json['graduation_rate'] as String,
      averageTuition: json['average_tuition'] as String,
      averageStudyYear: json['average_study_year'] as String,
      typeEn: json['type_en'] as String?,
      typeKh: json['type_kh'] as String?,
      logoImage: json['logo_image'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UniversityModelsToJson(UniversityModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'graduation_rate': instance.graduationRate,
      'average_tuition': instance.averageTuition,
      'average_study_year': instance.averageStudyYear,
      'type_en': instance.typeEn,
      'type_kh': instance.typeKh,
      'logo_image': instance.logoImage,
      'image': instance.image,
    };
