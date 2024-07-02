import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_specialize_models.g.dart';

@JsonSerializable()
class UniversitySpecializeModels {
   @JsonKey(name: 'id')
   final int id;

   @JsonKey(name: 'is_active')
   final int isActive;

   @JsonKey(name: 'specialize_name')
   final SpecializeName specializeName;

   @JsonKey(name: 'specialize_image')
   final String specializeImage;

  UniversitySpecializeModels({required this.id, required this.isActive, required this.specializeName, required this.specializeImage,});

  factory UniversitySpecializeModels.fromJson(Map<String, dynamic> json) => _$UniversitySpecializeModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversitySpecializeModelsToJson(this);

}

@JsonSerializable()
class SpecializeName {
   @JsonKey(name: 'id')
   final int id;

   @JsonKey(name: 'name_en')
   final String nameEn;

   @JsonKey(name: 'name_kh')
   final String nameKh;

  SpecializeName({required this.id, required this.nameEn, required this.nameKh,});

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory SpecializeName.fromJson(Map<String, dynamic> json) => _$SpecializeNameFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializeNameToJson(this);

} 