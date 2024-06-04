import 'package:json_annotation/json_annotation.dart';

part 'type_models.g.dart';

@JsonSerializable()
class TypeModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name_en')
  final String nameEn;

  @JsonKey(name: 'name_kh')
  final String nameKh;

  TypeModels({
    required this.id,
    required this.nameEn,
    required this.nameKh,
  });

  factory TypeModels.fromJson(Map<String, dynamic> json) => _$TypeModelsFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelsToJson(this);
}
