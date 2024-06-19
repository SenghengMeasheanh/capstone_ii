import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_tuition_models.g.dart';

@JsonSerializable()
class UniversityTuitionModels {
  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'tuition')
  final String tuition;

  UniversityTuitionModels({
    required this.nameEn,
    required this.nameKh,
    required this.tuition,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory UniversityTuitionModels.fromJson(Map<String, dynamic> json) =>_$UniversityTuitionModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityTuitionModelsToJson(this);
}
