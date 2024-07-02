import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/global/global_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'financial_aid_detail_models.g.dart';

@JsonSerializable()
class FinancialAidDetailModels extends FinancialAidModels {
  @JsonKey(name: 'detail_description_en')
  final String detailDescriptionEn;

  @JsonKey(name: 'detail_description_kh')
  final String detailDescriptionKh;

  @JsonKey(name: 'publish_at')
  final String publishAt;

  @JsonKey(name: 'update_at')
  final String updateAt;

  FinancialAidDetailModels({
    required super.id,
    required super.nameEn,
    required super.nameKh,
    required super.shortDescriptionEn,
    required super.shortDescriptionKh,
    required this.detailDescriptionEn,
    required this.detailDescriptionKh,
    required this.publishAt,
    required this.updateAt,
    required super.image,
  });
  String get detailDescription => getDataBasedOnCurrentLanguage(kh: detailDescriptionKh, en: detailDescriptionEn);

  factory FinancialAidDetailModels.fromJson(Map<String, dynamic> json) => _$FinancialAidDetailModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FinancialAidDetailModelsToJson(this);
}