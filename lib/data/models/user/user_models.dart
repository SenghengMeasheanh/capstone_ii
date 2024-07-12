import 'package:json_annotation/json_annotation.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserModels {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'birthday')
  final String birthday;

  @JsonKey(name: 'email')
  final String email;

  UserModels({
    required this.name,
    required this.gender,
    required this.birthday,
    required this.email,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => _$UserModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelsToJson(this);
}
