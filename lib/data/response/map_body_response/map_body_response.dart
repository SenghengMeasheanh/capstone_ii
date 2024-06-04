import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'map_body_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MapBodyResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final Body<T> body;

  MapBodyResponse(
    this.header,
    this.body,
  );

  factory MapBodyResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MapBodyResponseFromJson(json, fromJsonT);
  
}

@JsonSerializable(genericArgumentFactories: true)
class Body<T> {
  @JsonKey(name: 'data')
  final T data;

  Body(
    this.data,
  );

  factory Body.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BodyFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$BodyToJson(this, toJsonT);
}
