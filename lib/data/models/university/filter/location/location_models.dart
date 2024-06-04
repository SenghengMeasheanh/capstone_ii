import 'package:json_annotation/json_annotation.dart';

part 'location_models.g.dart';

@JsonSerializable()
class LocationModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'type')
  final String type;

  LocationModels({
    required this.id,
    required this.code,
    required this.nameKh,
    required this.nameEn,
    required this.type,
  });

  factory LocationModels.fromJson(Map<String, dynamic> json) => _$LocationModelsFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelsToJson(this);
}