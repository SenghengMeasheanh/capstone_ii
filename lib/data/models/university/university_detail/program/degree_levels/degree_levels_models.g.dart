// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degree_levels_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DegreeLevelsModels _$DegreeLevelsModelsFromJson(Map<String, dynamic> json) =>
    DegreeLevelsModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
    );

Map<String, dynamic> _$DegreeLevelsModelsToJson(DegreeLevelsModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
    };
