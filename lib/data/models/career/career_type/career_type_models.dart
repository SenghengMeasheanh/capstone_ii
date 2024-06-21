import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'career_type_models.g.dart';

@JsonSerializable()
class CareerTypeModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'is_active')
  final int isActive;

  CareerTypeModels({
    required this.id,
    required this.nameKh,
    required this.nameEn,
    required this.isActive,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn); 

  factory CareerTypeModels.fromJson(Map<String, dynamic> json) => _$CareerTypeModelsFromJson(json);

  Map<String, dynamic> toJson() => _$CareerTypeModelsToJson(this);
}
