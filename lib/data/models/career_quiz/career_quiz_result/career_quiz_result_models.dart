import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career_quiz_result_models.g.dart';

@JsonSerializable()
class CareerQuizResultModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'career_score')
  final double careerScore;

  CareerQuizResultModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
    required this.careerScore,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory CareerQuizResultModels.fromJson(Map<String, dynamic> json) =>_$CareerQuizResultModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CareerQuizResultModelsToJson(this);
}
