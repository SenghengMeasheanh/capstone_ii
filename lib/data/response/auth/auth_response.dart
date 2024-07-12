import 'package:capstone_ii/data/data_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final AuthBody body;

  const AuthResponse(
    this.header,
    this.body,
  );

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthBody {
  @JsonKey(name: 'user')
  final UserModels user;

  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  AuthBody({
    required this.user,
    required this.token,
    required this.refreshToken,
  });

  factory AuthBody.fromJson(Map<String, dynamic> json) => _$AuthBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthBodyToJson(this);
}
