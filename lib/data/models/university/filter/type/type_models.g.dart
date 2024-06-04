// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeModels _$TypeModelsFromJson(Map<String, dynamic> json) => TypeModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
    );

Map<String, dynamic> _$TypeModelsToJson(TypeModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
    };
