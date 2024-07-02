// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_overview_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityOverviewModels _$UniversityOverviewModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityOverviewModels(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      graduationRate: json['graduation_rate'] as String?,
      averageTuition: json['average_tuition'] as String?,
      averageStudyYear: json['average_study_year'] as String?,
      descriptionEn: json['description'] as String,
      descriptionKh: json['description_kh'] as String,
      type: TypeModels.fromJson(json['type'] as Map<String, dynamic>),
      studyOption: (json['study_option'] as List<dynamic>?)
          ?.map((e) => StudyOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UniversityOverviewModelsToJson(
        UniversityOverviewModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'graduation_rate': instance.graduationRate,
      'average_tuition': instance.averageTuition,
      'average_study_year': instance.averageStudyYear,
      'description': instance.descriptionEn,
      'description_kh': instance.descriptionKh,
      'type': instance.type,
      'study_option': instance.studyOption,
      'contact': instance.contact,
    };

StudyOption _$StudyOptionFromJson(Map<String, dynamic> json) => StudyOption(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
    );

Map<String, dynamic> _$StudyOptionToJson(StudyOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      addressLink: json['address_link'] as String,
      primaryPhoneNumber: json['primary_phone_number'] as String,
      secondPhoneNumber: json['second_phone_number'] as String?,
      thirdPhoneNumber: json['third_phone_number'] as String?,
      isActive: (json['is_active'] as num).toInt(),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'email': instance.email,
    'address': instance.address,
    'address_link': instance.addressLink,
    'primary_phone_number': instance.primaryPhoneNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('second_phone_number', instance.secondPhoneNumber);
  writeNotNull('third_phone_number', instance.thirdPhoneNumber);
  val['is_active'] = instance.isActive;
  return val;
}
