// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_body_secure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBodySecureResponse<T> _$ListBodySecureResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListBodySecureResponse<T>(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      json['body'] == null
          ? null
          : ListBodySecure<T>.fromJson(json['body'] as Map<String, dynamic>,
              (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$ListBodySecureResponseToJson<T>(
  ListBodySecureResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body?.toJson(
        (value) => toJsonT(value),
      ),
    };

ListBodySecure<T> _$ListBodySecureFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListBodySecure<T>(
      (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ListBodySecureToJson<T>(
  ListBodySecure<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonT).toList(),
    };
