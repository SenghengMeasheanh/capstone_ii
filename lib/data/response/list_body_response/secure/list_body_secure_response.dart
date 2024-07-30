import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'list_body_secure_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListBodySecureResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final ListBodySecure<T>? body;

  ListBodySecureResponse(
    this.header,
    this.body,
  );

  factory ListBodySecureResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListBodySecureResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListBodySecureResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ListBodySecure<T> {
  @JsonKey(name: 'data')
  final List<T>? data;

  ListBodySecure(
    this.data,
  );

  factory ListBodySecure.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListBodySecureFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListBodySecureToJson(this, toJsonT);
}
