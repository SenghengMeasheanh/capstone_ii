import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_detail_models.g.dart';

@JsonSerializable()
class EventDetailModels extends EventModels {
   @JsonKey(name: 'description_en')
   final String descriptionEn;

   @JsonKey(name: 'description_kh')
   final String descriptionKh;

   @JsonKey(name: 'register_link')
   final String registerLink;
   
   @JsonKey(name: 'category')
   final EventCategoryModels category;

  EventDetailModels({
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
    required this.category,
  });

  String get description => getDataBasedOnCurrentLanguage(kh: descriptionKh, en: descriptionEn);

  factory EventDetailModels.fromJson(Map<String, dynamic> json) => _$EventDetailModelsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventDetailModelsToJson(this);
}
