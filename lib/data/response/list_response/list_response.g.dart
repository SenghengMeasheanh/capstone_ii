// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponse<T> _$ListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListResponse<T>(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      (json['body'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ListResponseToJson<T>(
  ListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body.map(toJsonT).toList(),
    };
