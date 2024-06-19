import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_specialize_detail_models.g.dart';

@JsonSerializable()
class UniversitySpecializeDetailModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'description_en')
  final String descriptionEn;

  @JsonKey(name: 'description_kh')
  final String descriptionKh;

  @JsonKey(name: 'curriculum_url')
  final String curriculumUrl;

  UniversitySpecializeDetailModels({
    required this.id,
    required this.descriptionEn,
    required this.descriptionKh,
    required this.curriculumUrl,
  });

  String get description => getDataBasedOnCurrentLanguage(kh: descriptionKh, en: descriptionEn);

  factory UniversitySpecializeDetailModels.fromJson(Map<String, dynamic> json) =>_$UniversitySpecializeDetailModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversitySpecializeDetailModelsToJson(this);
}
