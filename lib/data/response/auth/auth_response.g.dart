// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      AuthBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

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
