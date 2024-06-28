import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'financial_aid_models.g.dart';

@JsonSerializable()
class FinancialAidModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'short_description_en')
  final String shortDescriptionEn;

  @JsonKey(name: 'short_description_kh')
  final String shortDescriptionKh;

  @JsonKey(name: 'image')
  final String image;

  FinancialAidModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
    required this.shortDescriptionEn,
    required this.shortDescriptionKh,
    required this.image,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  String get shortDescription => getDataBasedOnCurrentLanguage(kh: shortDescriptionKh, en: shortDescriptionEn);

  factory FinancialAidModels.fromJson(Map<String, dynamic> json) =>_$FinancialAidModelsFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialAidModelsToJson(this);
}
