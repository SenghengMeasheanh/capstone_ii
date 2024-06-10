import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'list_secure_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListSecureResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final List<T>? body;

  ListSecureResponse(
    this.header,
    this.body,
  );

  factory ListSecureResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListSecureResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListSecureResponseToJson(this, toJsonT);
}
