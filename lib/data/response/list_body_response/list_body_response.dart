import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'list_body_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListBodyResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final ListBody<T> body;

  ListBodyResponse(
    this.header,
    this.body,
  );

  factory ListBodyResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListBodyResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListBodyResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ListBody<T> {
  @JsonKey(name: 'list')
  final List<T> data;

  ListBody(
    this.data,
  );

  factory ListBody.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListBodyFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListBodyToJson(this, toJsonT);
}
