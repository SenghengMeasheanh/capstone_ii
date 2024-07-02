// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_scholarship_detail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityScholarshipDetailModels _$UniversityScholarshipDetailModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityScholarshipDetailModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionKh: json['description_kh'] as String,
      openDate: json['open_date'] as String,
      closeDate: json['close_date'] as String,
      applyLink: json['apply_link'] as String?,
      detailEn: json['detail_en'] as String,
      detailKh: json['detail_kh'] as String,
      image: json['image'] as String,
      contactInfo:
          Contact.fromJson(json['contact_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UniversityScholarshipDetailModelsToJson(
    UniversityScholarshipDetailModels instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name_en': instance.nameEn,
    'name_kh': instance.nameKh,
    'description_en': instance.descriptionEn,
    'description_kh': instance.descriptionKh,
    'open_date': instance.openDate,
    'close_date': instance.closeDate,
    'image': instance.image,
    'contact_info': instance.contactInfo,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apply_link', instance.applyLink);
  val['detail_en'] = instance.detailEn;
  val['detail_kh'] = instance.detailKh;
  return val;
}
