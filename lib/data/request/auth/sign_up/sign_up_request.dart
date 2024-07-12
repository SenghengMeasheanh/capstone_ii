import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'birthday')
  final String birthday;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignUpRequest({
    required this.name,
    required this.birthday,
    required this.gender,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
