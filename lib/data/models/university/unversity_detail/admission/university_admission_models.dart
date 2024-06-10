import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'university_admission_models.g.dart';

@JsonSerializable()
class UniversityAdmissionModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'average_student_acceptance')
  final int averageStudentAcceptance;

  @JsonKey(name: 'application_deadline')
  final String applicationDeadline;

  @JsonKey(name: 'application_fee')
  final String? applicationFee;

  @JsonKey(name: 'enroll_type_en')
  final String enrollTypeEn;

  @JsonKey(name: 'enroll_type_kh')
  final String enrollTypeKh;

  @JsonKey(name: 'description_en')
  final String descriptionEn;

  @JsonKey(name: 'description_kh')
  final String descriptionKh;

  @JsonKey(name: 'admission_url')
  final String? admissionUrl;

  @JsonKey(name: 'is_active')
  final int isActive;

  @JsonKey(name: 'tuition')
  final String tuition;

  @JsonKey(name: 'contact_info')
  final Contact contactInfo;

  UniversityAdmissionModels({
    required this.id,
    required this.averageStudentAcceptance,
    required this.applicationDeadline,
    required this.applicationFee,
    required this.enrollTypeEn,
    required this.enrollTypeKh,
    required this.descriptionEn,
    required this.descriptionKh,
    required this.admissionUrl,
    required this.isActive,
    required this.tuition,
    required this.contactInfo,
  });

  factory UniversityAdmissionModels.fromJson(Map<String, dynamic> json) =>
      _$UniversityAdmissionModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityAdmissionModelsToJson(this);
}
