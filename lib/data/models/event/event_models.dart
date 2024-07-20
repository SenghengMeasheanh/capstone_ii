import 'package:capstone_ii/helper/global/global_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_models.g.dart';

@JsonSerializable()
class EventModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'event_date')
  final String eventDate;

  @JsonKey(name: 'location')
  final String location;

  @JsonKey(name: 'location_link')
  final String locationLink;

  @JsonKey(name: 'start_at')
  final String startAt;

  @JsonKey(name: 'end_at')
  final String endAt;

  @JsonKey(name: 'thumbnail_image')
  final String thumbnailImage;

  EventModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
    required this.eventDate,
    required this.location,
    required this.locationLink,
    required this.startAt,
    required this.endAt,
    required this.thumbnailImage,
  });
  String get name => getDataBasedOnCurrentLanguage(kh: nameKh, en: nameEn);

  factory EventModels.fromJson(Map<String, dynamic> json) =>_$EventModelsFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelsToJson(this);
}
