import 'package:json_annotation/json_annotation.dart';

part 'university_models.g.dart';

@JsonSerializable()
class UniversityModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'graduation_rate')
  final String graduationRate;

  @JsonKey(name: 'average_tuition')
  final String averageTuition;

  @JsonKey(name: 'average_study_year')
  final String averageStudyYear;

  @JsonKey(name: 'type_en')
  final String? typeEn;


  @JsonKey(name: 'type_kh')
  final String? typeKh;


  @JsonKey(name: 'logo_image')
  final String? logoImage;

  @JsonKey(name: 'image')
  final String? image;

  UniversityModels({
    required this.id,
    required this.name,
    required this.graduationRate,
    required this.averageTuition,
    required this.averageStudyYear,
    required this.typeEn,
    required this.typeKh,
    this.logoImage,
    this.image,
  });

  factory UniversityModels.fromJson(Map<String, dynamic> json) => _$UniversityModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityModelsToJson(this);
}
