// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_body_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapBodyResponse<T> _$MapBodyResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MapBodyResponse<T>(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      Body<T>.fromJson(
          json['body'] as Map<String, dynamic>, (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$MapBodyResponseToJson<T>(
  MapBodyResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body.toJson(
        (value) => toJsonT(value),
      ),
    };

Body<T> _$BodyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Body<T>(
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$BodyToJson<T>(
  Body<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
