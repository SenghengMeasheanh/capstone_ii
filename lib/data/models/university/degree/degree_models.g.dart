// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degree_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DegreeModels _$DegreeModelsFromJson(Map<String, dynamic> json) => DegreeModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
    );

Map<String, dynamic> _$DegreeModelsToJson(DegreeModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
    };
