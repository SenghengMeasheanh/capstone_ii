// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_body_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBodyResponse<T> _$ListBodyResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListBodyResponse<T>(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      ListBody<T>.fromJson(
          json['body'] as Map<String, dynamic>, (value) => fromJsonT(value)),
    );

Map<String, dynamic> _$ListBodyResponseToJson<T>(
  ListBodyResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body.toJson(
        (value) => toJsonT(value),
      ),
    };

ListBody<T> _$ListBodyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListBody<T>(
      (json['list'] as List<dynamic>).map(fromJsonT).toList(),
      Paginate.fromJson(json['paginate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListBodyToJson<T>(
  ListBody<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'list': instance.data.map(toJsonT).toList(),
      'paginate': instance.paginate,
    };

Paginate _$PaginateFromJson(Map<String, dynamic> json) => Paginate(
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginateToJson(Paginate instance) => <String, dynamic>{
      'total': instance.total,
    };
