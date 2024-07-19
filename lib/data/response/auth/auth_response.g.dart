// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      json['body'] == null
          ? null
          : AuthBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) {
  final val = <String, dynamic>{
    'header': instance.header,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('body', instance.body);
  return val;
}

AuthBody _$AuthBodyFromJson(Map<String, dynamic> json) => AuthBody(
      user: UserModels.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$AuthBodyToJson(AuthBody instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
    };
