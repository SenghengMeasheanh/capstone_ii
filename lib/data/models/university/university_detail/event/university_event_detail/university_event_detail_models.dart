import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_event_detail_models.g.dart';

@JsonSerializable()
class UniversityEventDetailModels extends UniversityEventModels {
   @JsonKey(name: 'description_en')
   final String descriptionEn;

   @JsonKey(name: 'description_kh')
   final String descriptionKh;

   @JsonKey(name: 'register_link')
   final String registerLink;

   @JsonKey(name: 'is_active')
   final int isActive;

   @JsonKey(name: 'category')
   final Category category;

   UniversityEventDetailModels({
    required super.id,
    required super.nameEn,
    required super.nameKh,
    required super.eventDate,
    required super.location,
    required super.locationLink,
    required super.startAt,
    required super.endAt,
    required super.thumbnailImage,
    required this.descriptionEn,
    required this.descriptionKh,
    required this.registerLink,
    required this.isActive,
    required this.category,
  });

  @override
  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  String get description => getDataBasedOnCurrentLanguage(kh: descriptionKh, en: descriptionEn);

  factory UniversityEventDetailModels.fromJson(Map<String, dynamic> json) => _$UniversityEventDetailModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UniversityEventDetailModelsToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'is_active')
  final int isActive;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameKh,
    required this.isActive,
  });

  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}