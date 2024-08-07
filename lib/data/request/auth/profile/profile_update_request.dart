import 'package:json_annotation/json_annotation.dart';

part 'profile_update_request.g.dart';

@JsonSerializable()
class ProfileUpdateRequest {
   @JsonKey(name: 'name')
   final String name;

   @JsonKey(name: 'birthday')
   final String birthday;

   @JsonKey(name: 'gender')
   final String gender;

   @JsonKey(name: 'phone_numer')
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

  ProfileUpdateRequest({required this.name, required this.birthday, required this.gender, required this.phoneNumber, required this.address, required this.universityName, required this.universityGraduationYear, required this.universityMajor, required this.highSchoolName, required this.highSchoolGraduationYear, required this.highSchoolGrade, required this.religion, required this.nationality, required this.country, required this.imageProfile});

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) => _$ProfileUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUpdateRequestToJson(this);
}