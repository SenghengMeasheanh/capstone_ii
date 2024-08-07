// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_detail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerDetailModels _$CareerDetailModelsFromJson(Map<String, dynamic> json) =>
    CareerDetailModels(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      nameEn: json['name_en'] as String,
      nameKh: json['name_kh'] as String,
      yearlyIncome: (json['yearly_income'] as num).toInt(),
      jobGrowthRate: json['job_growth_rate'] as String,
      jobDoEn: json['job_do_en'] as String,
      jobDoKh: json['job_do_kh'] as String,
      commonDegreeLevel: DegreeLevelsModels.fromJson(
          json['common_degree_level'] as Map<String, dynamic>),
      earningEn: json['earning_en'] as String?,
      jobOutlookEn: json['job_outlook_en'] as String?,
      taskEn: json['task_en'] as String?,
      knowledgeEn: json['knowledge_en'] as String?,
      skillEn: json['skill_en'] as String?,
      isActive: (json['is_active'] as num).toInt(),
      earningKh: json['earning_kh'] as String?,
      jobOutlookKh: json['job_outlook_kh'] as String?,
      taskKh: json['task_kh'] as String?,
      knowledgeKh: json['knowledge_kh'] as String?,
      skillKh: json['skill_kh'] as String?,
      careerTypes: (json['career_types'] as List<dynamic>)
          .map((e) => CareerTypeModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      careerEducationLevels: (json['career_education_levels'] as List<dynamic>)
          .map((e) => CareerEducationLevels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CareerDetailModelsToJson(CareerDetailModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name_en': instance.nameEn,
      'name_kh': instance.nameKh,
      'yearly_income': instance.yearlyIncome,
      'job_growth_rate': instance.jobGrowthRate,
      'job_do_en': instance.jobDoEn,
      'job_do_kh': instance.jobDoKh,
      'common_degree_level': instance.commonDegreeLevel,
      'earning_en': instance.earningEn,
      'job_outlook_en': instance.jobOutlookEn,
      'task_en': instance.taskEn,
      'knowledge_en': instance.knowledgeEn,
      'skill_en': instance.skillEn,
      'is_active': instance.isActive,
      'earning_kh': instance.earningKh,
      'job_outlook_kh': instance.jobOutlookKh,
      'task_kh': instance.taskKh,
      'knowledge_kh': instance.knowledgeKh,
      'skill_kh': instance.skillKh,
      'career_types': instance.careerTypes,
      'career_education_levels': instance.careerEducationLevels,
    };

CareerEducationLevels _$CareerEducationLevelsFromJson(
        Map<String, dynamic> json) =>
    CareerEducationLevels(
      degreeLevel: DegreeLevelsModels.fromJson(
          json['degree_level'] as Map<String, dynamic>),
      percentage: json['percentage'] as String,
    );

Map<String, dynamic> _$CareerEducationLevelsToJson(
        CareerEducationLevels instance) =>
    <String, dynamic>{
      'degree_level': instance.degreeLevel,
      'percentage': instance.percentage,
    };
