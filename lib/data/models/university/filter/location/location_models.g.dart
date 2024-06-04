// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModels _$LocationModelsFromJson(Map<String, dynamic> json) =>
    LocationModels(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      nameKh: json['name_kh'] as String,
      nameEn: json['name_en'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$LocationModelsToJson(LocationModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name_kh': instance.nameKh,
      'name_en': instance.nameEn,
      'type': instance.type,
    };
