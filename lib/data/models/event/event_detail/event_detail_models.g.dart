// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailModels _$EventDetailModelsFromJson(Map<String, dynamic> json) =>
    EventDetailModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      eventDate: json['event_date'] as String,
      location: json['location'] as String,
      locationLink: json['location_link'] as String,
      startAt: json['start_at'] as String,
      endAt: json['end_at'] as String,
      thumbnailImage: json['thumbnail_image'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionKh: json['description_kh'] as String,
      registerLink: json['register_link'] as String,
      category: EventCategoryModels.fromJson(
          json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventDetailModelsToJson(EventDetailModels instance) =>
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
      'description_en': instance.descriptionEn,
      'description_kh': instance.descriptionKh,
      'register_link': instance.registerLink,
      'category': instance.category,
    };
