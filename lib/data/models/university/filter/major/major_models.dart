import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'major_models.g.dart';

@JsonSerializable()
class MajorModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  MajorModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory MajorModels.fromJson(Map<String, dynamic> json) => _$MajorModelsFromJson(json);

  Map<String, dynamic> toJson() => _$MajorModelsToJson(this);
}
