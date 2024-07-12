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
      MapBody<T>.fromJson(
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

MapBody<T> _$MapBodyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MapBody<T>(
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$MapBodyToJson<T>(
  MapBody<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
