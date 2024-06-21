// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerModels _$CareerModelsFromJson(Map<String, dynamic> json) => CareerModels(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      yearlyIncome: (json['yearly_income'] as num).toInt(),
      jobGrowthRate: json['job_growth_rate'] as String,
      jobDoEn: json['job_do_en'] as String,
      jobDoKh: json['job_do_kh'] as String,
    );

Map<String, dynamic> _$CareerModelsToJson(CareerModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'yearly_income': instance.yearlyIncome,
      'job_growth_rate': instance.jobGrowthRate,
      'job_do_en': instance.jobDoEn,
      'job_do_kh': instance.jobDoKh,
    };
