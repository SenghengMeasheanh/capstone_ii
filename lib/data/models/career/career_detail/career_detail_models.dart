import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career_detail_models.g.dart';

@JsonSerializable()
class CareerDetailModels extends CareerModels {
  @JsonKey(name: 'common_degree_level')
  final DegreeLevelsModels commonDegreeLevel;

  @JsonKey(name: 'earning_en')
  final String? earningEn;

  @JsonKey(name: 'job_outlook_en')
  final String? jobOutlookEn;

  @JsonKey(name: 'task_en')
  final String? taskEn;

  @JsonKey(name: 'knowledge_en')
  final String? knowledgeEn;

  @JsonKey(name: 'skill_en')
  final String ?skillEn;

  @JsonKey(name: 'is_active')
  final int isActive;

  @JsonKey(name: 'earning_kh')
  final String? earningKh;

  @JsonKey(name: 'job_outlook_kh')
  final String? jobOutlookKh;

  @JsonKey(name: 'task_kh')
  final String? taskKh;

  @JsonKey(name: 'knowledge_kh')
  final String? knowledgeKh;

  @JsonKey(name: 'skill_kh')
  final String? skillKh;

  @JsonKey(name: 'career_types')
  final List<CareerTypeModels> careerTypes;

  @JsonKey(name: 'career_education_levels')
  final List<CareerEducationLevels> careerEducationLevels;

  CareerDetailModels({
    required super.id,
    required super.image,
    required super.nameEn,
    required super.nameKh,
    required super.yearlyIncome,
    required super.jobGrowthRate,
    required super.jobDoEn,
    required super.jobDoKh,
    required this.commonDegreeLevel,
    required this.earningEn,
    required this.jobOutlookEn,
    required this.taskEn,
    required this.knowledgeEn,
    required this.skillEn,
    required this.isActive,
    required this.earningKh,
    required this.jobOutlookKh,
    required this.taskKh,
    required this.knowledgeKh,
    required this.skillKh,
    required this.careerTypes,
    required this.careerEducationLevels,
  });

  String? get earning => getDataBasedOnCurrentLanguage(kh: earningKh, en: earningEn);

  String? get jobOutlook => getDataBasedOnCurrentLanguage(kh: jobOutlookKh, en: jobOutlookEn);

  String? get task => getDataBasedOnCurrentLanguage(kh: taskKh, en: taskEn);

  String? get knowledge => getDataBasedOnCurrentLanguage(kh: knowledgeKh, en: knowledgeEn);

  String? get skill => getDataBasedOnCurrentLanguage(kh: skillKh, en: skillEn);

  factory CareerDetailModels.fromJson(Map<String, dynamic> json) => _$CareerDetailModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CareerDetailModelsToJson(this);
}

@JsonSerializable()
class CareerEducationLevels {
  @JsonKey(name: 'degree_level')
  final DegreeLevelsModels degreeLevel;

  @JsonKey(name: 'percentage')
  final String percentage;

  CareerEducationLevels({
    required this.degreeLevel,
    required this.percentage,
  });

  factory CareerEducationLevels.fromJson(Map<String, dynamic> json) => _$CareerEducationLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$CareerEducationLevelsToJson(this);
}
