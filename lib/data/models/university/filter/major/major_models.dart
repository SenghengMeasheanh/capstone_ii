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

  MajorModels({required this.id, required this.nameEn, required this.nameKh});

  factory MajorModels.fromJson(Map<String, dynamic> json) => _$MajorModelsFromJson(json);

  Map<String, dynamic> toJson() => _$MajorModelsToJson(this);
}