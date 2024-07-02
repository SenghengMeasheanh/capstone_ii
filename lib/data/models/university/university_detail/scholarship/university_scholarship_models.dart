import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_scholarship_models.g.dart';

@JsonSerializable()
class UniversityScholarshipModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'description_en')
  final String descriptionEn;

  @JsonKey(name: 'description_kh')
  final String descriptionKh;

  @JsonKey(name: 'open_date')
  final String openDate;

  @JsonKey(name: 'close_date')
  final String closeDate;

  @JsonKey(name: 'image')
  final String image;

  UniversityScholarshipModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
    required this.descriptionEn,
    required this.descriptionKh,
    required this.openDate,
    required this.closeDate,
    required this.image,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  String get description => getDataBasedOnCurrentLanguage(kh: descriptionKh, en: descriptionEn);

  factory UniversityScholarshipModels.fromJson(Map<String, dynamic> json) =>_$UniversityScholarshipModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityScholarshipModelsToJson(this);
}
