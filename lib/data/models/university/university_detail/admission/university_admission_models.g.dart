// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_admission_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityAdmissionModels _$UniversityAdmissionModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityAdmissionModels(
      id: (json['id'] as num).toInt(),
      averageStudentAcceptance:
          (json['average_student_acceptance'] as num).toInt(),
      applicationDeadline: json['application_deadline'] as String,
      applicationFee: json['application_fee'] as String?,
      enrollTypeEn: json['enroll_type_en'] as String,
      enrollTypeKh: json['enroll_type_kh'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionKh: json['description_kh'] as String,
      admissionUrl: json['admission_url'] as String?,
      isActive: (json['is_active'] as num).toInt(),
      tuition: json['tuition'] as String,
      contactInfo:
          Contact.fromJson(json['contact_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UniversityAdmissionModelsToJson(
        UniversityAdmissionModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'average_student_acceptance': instance.averageStudentAcceptance,
      'application_deadline': instance.applicationDeadline,
      'application_fee': instance.applicationFee,
      'enroll_type_en': instance.enrollTypeEn,
      'enroll_type_kh': instance.enrollTypeKh,
      'description_en': instance.descriptionEn,
      'description_kh': instance.descriptionKh,
      'admission_url': instance.admissionUrl,
      'is_active': instance.isActive,
      'tuition': instance.tuition,
      'contact_info': instance.contactInfo,
    };
