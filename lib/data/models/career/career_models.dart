import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career_models.g.dart';

@JsonSerializable()
class CareerModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'yearly_income')
  final int yearlyIncome;

  @JsonKey(name: 'job_growth_rate')
  final String jobGrowthRate;

  @JsonKey(name: 'job_do_en')
  final String jobDoEn;

  @JsonKey(name: 'job_do_kh')
  final String jobDoKh;

  CareerModels({
    required this.id,
    required this.image,
    required this.nameEn,
    required this.nameKh,
    required this.yearlyIncome,
    required this.jobGrowthRate,
    required this.jobDoEn,
    required this.jobDoKh,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  String get jobDo => getDataBasedOnCurrentLanguage(kh: jobDoKh, en: jobDoEn);

  factory CareerModels.fromJson(Map<String, dynamic> json) => _$CareerModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CareerModelsToJson(this);
}
