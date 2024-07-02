import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'degree_levels_models.g.dart';

@JsonSerializable()
class DegreeLevelsModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  DegreeLevelsModels({required this.id, required this.nameEn, required this.nameKh});

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory DegreeLevelsModels.fromJson(Map<String, dynamic> json) => _$DegreeLevelsModelsFromJson(json);

  Map<String, dynamic> toJson() => _$DegreeLevelsModelsToJson(this);
}
