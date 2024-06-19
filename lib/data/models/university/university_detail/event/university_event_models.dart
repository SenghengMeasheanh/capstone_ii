import 'package:capstone_ii/helper/global/global_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_event_models.g.dart';

@JsonSerializable()
class UniversityEventModels {
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

  UniversityEventModels({
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

  factory UniversityEventModels.fromJson(Map<String, dynamic> json) => _$UniversityEventModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityEventModelsToJson(this);
}
