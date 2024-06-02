// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'major_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MajorModels _$MajorModelsFromJson(Map<String, dynamic> json) => MajorModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
    );

Map<String, dynamic> _$MajorModelsToJson(MajorModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
    };
