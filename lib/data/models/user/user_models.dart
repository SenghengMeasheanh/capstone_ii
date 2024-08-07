import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserModels {
  @JsonKey(name: 'id')
  final int id;
  
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'birthday')
  final String birthday;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'university_name')
  final String? universityName;

  @JsonKey(name: 'university_graduation_year')
  final int? universityGraduationYear;

  @JsonKey(name: 'university_major')
  final String? universityMajor;

  @JsonKey(name: 'high_school_name')
  final String? highSchoolName;

  @JsonKey(name: 'high_school_graduation_year')
  final int? highSchoolGraduationYear;

  @JsonKey(name: 'high_school_grade')
  final String? highSchoolGrade;

  @JsonKey(name: 'religion')
  final String? religion;

  @JsonKey(name: 'nationality')
  final String? nationality;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'image_profile')
  final String? imageProfile;

  UserModels({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.email,
    this.phoneNumber,
    this.address,
    this.universityName,
    this.universityGraduationYear,
    this.universityMajor,
    this.highSchoolName,
    this.highSchoolGraduationYear,
    this.highSchoolGrade,
    this.religion,
    this.country,
    this.nationality,
    this.imageProfile,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => _$UserModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelsToJson(this);
}
