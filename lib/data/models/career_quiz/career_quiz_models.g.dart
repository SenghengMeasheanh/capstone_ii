// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerQuizModels _$CareerQuizModelsFromJson(Map<String, dynamic> json) =>
    CareerQuizModels(
      id: (json['id'] as num).toInt(),
      questionTextEn: json['question_text_en'] as String,
      questionTextKh: json['question_text_kh'] as String,
    );

Map<String, dynamic> _$CareerQuizModelsToJson(CareerQuizModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text_en': instance.questionTextEn,
      'question_text_kh': instance.questionTextKh,
    };
