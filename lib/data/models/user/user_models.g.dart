// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModels _$UserModelsFromJson(Map<String, dynamic> json) => UserModels(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      gender: json['gender'] as String,
      birthday: json['birthday'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      universityName: json['university_name'] as String?,
      universityGraduationYear:
          (json['university_graduation_year'] as num?)?.toInt(),
      universityMajor: json['university_major'] as String?,
      highSchoolName: json['high_school_name'] as String?,
      highSchoolGraduationYear:
          (json['high_school_graduation_year'] as num?)?.toInt(),
      highSchoolGrade: json['high_school_grade'] as String?,
      religion: json['religion'] as String?,
      country: json['country'] as String?,
      nationality: json['nationality'] as String?,
      imageProfile: json['image_profile'] as String?,
    );

Map<String, dynamic> _$UserModelsToJson(UserModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'university_name': instance.universityName,
      'university_graduation_year': instance.universityGraduationYear,
      'university_major': instance.universityMajor,
      'high_school_name': instance.highSchoolName,
      'high_school_graduation_year': instance.highSchoolGraduationYear,
      'high_school_grade': instance.highSchoolGrade,
      'religion': instance.religion,
      'nationality': instance.nationality,
      'country': instance.country,
      'image_profile': instance.imageProfile,
    };
