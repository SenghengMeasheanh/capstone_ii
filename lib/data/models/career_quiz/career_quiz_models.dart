import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career_quiz_models.g.dart';

@JsonSerializable()
class CareerQuizModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'question_text_en')
  final String questionTextEn;

  @JsonKey(name: 'question_text_kh')
  final String questionTextKh;

  CareerQuizModels({
    required this.id,
    required this.questionTextEn,
    required this.questionTextKh,
  });

  String get questionText => getDataBasedOnCurrentLanguage(kh: questionTextKh, en: questionTextEn);

  factory CareerQuizModels.fromJson(Map<String, dynamic> json) => _$CareerQuizModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CareerQuizModelsToJson(this);
}
