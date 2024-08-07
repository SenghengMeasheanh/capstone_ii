import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'map_body_secure_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MapBodySecureResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final MapBodySecure<T>? body;

  MapBodySecureResponse(
    this.header,
    this.body,
  );

  factory MapBodySecureResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MapBodySecureResponseFromJson(json, fromJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class MapBodySecure<T> {
  @JsonKey(name: 'data')
  final T data;

  MapBodySecure(
    this.data,
  );

  factory MapBodySecure.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MapBodySecureFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$MapBodySecureToJson(this, toJsonT);
}
