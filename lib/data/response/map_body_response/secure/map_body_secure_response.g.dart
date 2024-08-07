// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_body_secure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapBodySecureResponse<T> _$MapBodySecureResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MapBodySecureResponse<T>(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      json['body'] == null
          ? null
          : MapBodySecure<T>.fromJson(json['body'] as Map<String, dynamic>,
              (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$MapBodySecureResponseToJson<T>(
  MapBodySecureResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body?.toJson(
        (value) => toJsonT(value),
      ),
    };

MapBodySecure<T> _$MapBodySecureFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MapBodySecure<T>(
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$MapBodySecureToJson<T>(
  MapBodySecure<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
