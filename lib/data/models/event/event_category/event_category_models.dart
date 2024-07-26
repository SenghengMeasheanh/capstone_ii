import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_category_models.g.dart';

@JsonSerializable()
class EventCategoryModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'is_active')
  final int isActive;

  EventCategoryModels({
    required this.id,
    required this.nameKh,
    required this.nameEn,
    required this.isActive,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory EventCategoryModels.fromJson(Map<String, dynamic> json) => _$EventCategoryModelsFromJson(json);

  Map<String, dynamic> toJson() => _$EventCategoryModelsToJson(this);
}
