import 'package:json_annotation/json_annotation.dart';

part 'university_major_detail_models.g.dart';

@JsonSerializable()
class UniversityMajorDetailModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'description_en')
  final String descriptionEn;

  @JsonKey(name: 'description_kh')
  final String descriptionKh;

  @JsonKey(name: 'curriculum_url')
  final String curriculumUrl;

  UniversityMajorDetailModels({
    required this.id,
    required this.descriptionEn,
    required this.descriptionKh,
    required this.curriculumUrl,
  });

  factory UniversityMajorDetailModels.fromJson(Map<String, dynamic> json) =>_$UniversityMajorDetailModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityMajorDetailModelsToJson(this);
}
