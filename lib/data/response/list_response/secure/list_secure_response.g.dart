// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_secure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSecureResponse<T> _$ListSecureResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListSecureResponse<T>(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      (json['body'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ListSecureResponseToJson<T>(
  ListSecureResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body?.map(toJsonT).toList(),
    };
