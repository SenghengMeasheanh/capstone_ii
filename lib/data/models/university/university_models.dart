import 'package:capstone_ii/helper/global/global_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_models.g.dart';

@JsonSerializable()
class UniversityModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

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
    required this.nameEn,
    required this.nameKh,
    required this.graduationRate,
    required this.averageTuition,
    required this.averageStudyYear,
    required this.typeEn,
    required this.typeKh,
    this.logoImage,
    this.image,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  String get type => getDataBasedOnCurrentLanguage(kh: typeKh!, en: typeEn!);

  factory UniversityModels.fromJson(Map<String, dynamic> json) => _$UniversityModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityModelsToJson(this);
}
