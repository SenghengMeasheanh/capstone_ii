// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_quiz_result_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerQuizResultModels _$CareerQuizResultModelsFromJson(
        Map<String, dynamic> json) =>
    CareerQuizResultModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      careerScore: (json['career_score'] as num).toDouble(),
    );

Map<String, dynamic> _$CareerQuizResultModelsToJson(
        CareerQuizResultModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'career_score': instance.careerScore,
    };
