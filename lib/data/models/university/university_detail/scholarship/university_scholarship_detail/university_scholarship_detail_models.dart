import 'package:capstone_ii/data/data_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_scholarship_detail_models.g.dart';

@JsonSerializable()
class UniversityScholarshipDetailModels extends UniversityScholarshipModels {
  @JsonKey(name: 'contact_info')
  final Contact contactInfo;

  @JsonKey(name: 'apply_link', includeIfNull: false)
  final String? applyLink;

  @JsonKey(name: 'detail_en')
  final String detailEn;

  @JsonKey(name: 'detail_kh')
  final String detailKh;

  UniversityScholarshipDetailModels({
    required super.id,
    required super.nameEn,
    required super.nameKh,
    required super.descriptionEn,
    required super.descriptionKh,
    required super.openDate,
    required super.closeDate,
    required this.applyLink,
    required this.detailEn,
    required this.detailKh,
    required super.image,
    required this.contactInfo,
  });

  factory UniversityScholarshipDetailModels.fromJson(Map<String, dynamic> json) =>
      _$UniversityScholarshipDetailModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UniversityScholarshipDetailModelsToJson(this);
}
