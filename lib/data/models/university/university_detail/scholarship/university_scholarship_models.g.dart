// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_scholarship_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityScholarshipModels _$UniversityScholarshipModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityScholarshipModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionKh: json['description_kh'] as String,
      openDate: json['open_date'] as String,
      closeDate: json['close_date'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UniversityScholarshipModelsToJson(
        UniversityScholarshipModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'description_en': instance.descriptionEn,
      'description_kh': instance.descriptionKh,
      'open_date': instance.openDate,
      'close_date': instance.closeDate,
      'image': instance.image,
    };
