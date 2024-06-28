// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_aid_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialAidModels _$FinancialAidModelsFromJson(Map<String, dynamic> json) =>
    FinancialAidModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      shortDescriptionEn: json['short_description_en'] as String,
      shortDescriptionKh: json['short_description_kh'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$FinancialAidModelsToJson(FinancialAidModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'short_description_en': instance.shortDescriptionEn,
      'short_description_kh': instance.shortDescriptionKh,
      'image': instance.image,
    };
