// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_event_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniversityEventModels _$UniversityEventModelsFromJson(
        Map<String, dynamic> json) =>
    UniversityEventModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      eventDate: json['event_date'] as String,
      location: json['location'] as String,
      locationLink: json['location_link'] as String,
      startAt: json['start_at'] as String,
      endAt: json['end_at'] as String,
      thumbnailImage: json['thumbnail_image'] as String,
    );

Map<String, dynamic> _$UniversityEventModelsToJson(
        UniversityEventModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'event_date': instance.eventDate,
      'location': instance.location,
      'location_link': instance.locationLink,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'thumbnail_image': instance.thumbnailImage,
    };
