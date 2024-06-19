import 'package:capstone_ii/helper/global/global_helper.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'university_overview_models.g.dart';

@JsonSerializable()
class UniversityOverviewModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'graduation_rate')
  final String? graduationRate;

  @JsonKey(name: 'average_tuition')
  final String? averageTuition;

  @JsonKey(name: 'average_study_year')
  final String? averageStudyYear;

  @JsonKey(name: 'description')
  final String descriptionEn;

  @JsonKey(name: 'description_kh')
  final String descriptionKh;

  @JsonKey(name: 'type')
  final TypeModels type;

  @JsonKey(name: 'study_option')
  final List<StudyOption>? studyOption;

  @JsonKey(name: 'contact')
  final Contact? contact;

  UniversityOverviewModels({
    required this.id,
    required this.name,
    required this.graduationRate,
    required this.averageTuition,
    required this.averageStudyYear,
    required this.descriptionEn,
    required this.descriptionKh,
    required this.type,
    required this.studyOption,
    required this.contact,
  });

  get description => getDataBasedOnCurrentLanguage(kh: descriptionKh, en: descriptionEn);

  factory UniversityOverviewModels.fromJson(Map<String, dynamic> json) => _$UniversityOverviewModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityOverviewModelsToJson(this);
}

@JsonSerializable()
class StudyOption {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  StudyOption({
    required this.id,
    required this.nameEn,
    required this.nameKh,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory StudyOption.fromJson(Map<String, dynamic> json) => _$StudyOptionFromJson(json);

  Map<String, dynamic> toJson() => _$StudyOptionToJson(this);
}

@JsonSerializable()
class Contact {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'primary_phone_number')
  final String primaryPhoneNumber;

  @JsonKey(name: 'second_phone_number', includeIfNull: false)
  final String? secondPhoneNumber;

  @JsonKey(name: 'third_phone_number', includeIfNull: false)
  final String? thirdPhoneNumber;

  @JsonKey(name: 'is_active', includeIfNull: false)
  final int isActive;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.primaryPhoneNumber,
    required this.secondPhoneNumber,
    required this.thirdPhoneNumber,
    required this.isActive,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
