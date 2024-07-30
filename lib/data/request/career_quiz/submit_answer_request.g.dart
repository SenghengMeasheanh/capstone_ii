// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_answer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitAnswerRequest _$SubmitAnswerRequestFromJson(Map<String, dynamic> json) =>
    SubmitAnswerRequest(
      answer: (json['answer'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmitAnswerRequestToJson(
        SubmitAnswerRequest instance) =>
    <String, dynamic>{
      'answer': instance.answer,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      questionId: (json['question_id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'rating': instance.rating,
    };
