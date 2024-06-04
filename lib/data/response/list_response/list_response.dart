import 'package:json_annotation/json_annotation.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final List<T> body;

  ListResponse(
    this.header,
    this.body,
  );

  factory ListResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListResponseToJson(this, toJsonT);
}
