import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'static_pages_models.g.dart';

@JsonSerializable()
class StaticPagesModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'alias')
  final String alias;

  @JsonKey(name: 'content_en')
  final String contentEn;

  @JsonKey(name: 'content_kh')
  final String contentKh;

  @JsonKey(name: 'is_active')
  final int isActive;

  StaticPagesModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
    required this.alias,
    required this.contentEn,
    required this.contentKh,
    required this.isActive,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameKh);

  String get content => getDataBasedOnCurrentLanguage(kh: contentKh, en: contentEn);

  factory StaticPagesModels.fromJson(Map<String, dynamic> json) => _$StaticPagesModelsFromJson(json);

  Map<String, dynamic> toJson() => _$StaticPagesModelsToJson(this);
}
