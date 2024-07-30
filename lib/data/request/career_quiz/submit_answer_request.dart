import 'package:json_annotation/json_annotation.dart';

part 'submit_answer_request.g.dart';

@JsonSerializable()
class SubmitAnswerRequest {
  @JsonKey(name: 'answer')
  final List<Answer> answer;

  SubmitAnswerRequest({
    required this.answer,
  });

  factory SubmitAnswerRequest.fromJson(Map<String, dynamic> json) => _$SubmitAnswerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitAnswerRequestToJson(this);
}

@JsonSerializable()
class Answer {
  @JsonKey(name: 'question_id')
  final int questionId;

  @JsonKey(name: 'rating')
  final int rating;

  Answer({
    required this.questionId,
    required this.rating,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
