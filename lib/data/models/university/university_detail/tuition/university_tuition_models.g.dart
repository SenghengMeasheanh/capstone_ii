// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_tuition_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityTuitionModels _$UniversityTuitionModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityTuitionModels(
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      tuition: json['tuition'] as String,
    );

Map<String, dynamic> _$UniversityTuitionModelsToJson(
        UniversityTuitionModels instance) =>
    <String, dynamic>{
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'tuition': instance.tuition,
    };
