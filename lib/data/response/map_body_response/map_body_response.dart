import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'map_body_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MapBodyResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final MapBody<T> body;

  MapBodyResponse(
    this.header,
    this.body,
  );

  factory MapBodyResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MapBodyResponseFromJson(json, fromJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class MapBody<T> {
  @JsonKey(name: 'data')
  final T data;

  MapBody(
    this.data,
  );

  factory MapBody.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MapBodyFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$MapBodyToJson(this, toJsonT);
}
