// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_aid_detail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialAidDetailModels _$FinancialAidDetailModelsFromJson(
        Map<String, dynamic> json) =>
    FinancialAidDetailModels(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      shortDescriptionEn: json['short_description_en'] as String,
      shortDescriptionKh: json['short_description_kh'] as String,
      detailDescriptionEn: json['detail_description_en'] as String,
      detailDescriptionKh: json['detail_description_kh'] as String,
      publishAt: json['publish_at'] as String,
      updateAt: json['update_at'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$FinancialAidDetailModelsToJson(
        FinancialAidDetailModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'short_description_en': instance.shortDescriptionEn,
      'short_description_kh': instance.shortDescriptionKh,
      'image': instance.image,
      'detail_description_en': instance.detailDescriptionEn,
      'detail_description_kh': instance.detailDescriptionKh,
      'publish_at': instance.publishAt,
      'update_at': instance.updateAt,
    };
