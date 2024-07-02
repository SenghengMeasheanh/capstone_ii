import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scholarship_detail_models.g.dart';

@JsonSerializable()
class ScholarshipDetailModels extends ScholarshipModels {
  @JsonKey(name: 'contact_info')
  final Contact contactInfo;

  @JsonKey(name: 'apply_link', includeIfNull: false)
  final String? applyLink;

  @JsonKey(name: 'detail_en')
  final String detailEn;

  @JsonKey(name: 'detail_kh')
  final String detailKh;
  ScholarshipDetailModels({
    required super.id,
    required super.nameEn,
    required super.nameKh,
    required super.descriptionEn,
    required super.descriptionKh,
    required super.openDate,
    required super.closeDate,
    required super.image,
    required this.contactInfo,
    required this.applyLink,
    required this.detailEn,
    required this.detailKh,
  });

  String get detail => getDataBasedOnCurrentLanguage(kh: detailKh, en: detailEn);

  factory ScholarshipDetailModels.fromJson(Map<String, dynamic> json) =>_$ScholarshipDetailModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScholarshipDetailModelsToJson(this);
}
