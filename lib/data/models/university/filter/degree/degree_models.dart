import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'degree_models.g.dart';

@JsonSerializable()
class DegreeModels {
   @JsonKey(name: 'id')
   final int id;

   @JsonKey(name: 'name_en')
   final String nameEn;

   @JsonKey(name: 'name_kh')
   final String nameKh;

  DegreeModels({required this.id, required this.nameEn, required this.nameKh,});

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory DegreeModels.fromJson(Map<String, dynamic> json) => _$DegreeModelsFromJson(json);

  Map<String, dynamic> toJson() => _$DegreeModelsToJson(this);
  
}