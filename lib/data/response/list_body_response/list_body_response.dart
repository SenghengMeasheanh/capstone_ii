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
  @JsonKey(name: 'data')
  final List<T> data;

  @JsonKey(name: 'paginate')
  final Paginate? paginate;

  ListBody(
    this.data, this.paginate,
  );

  factory ListBody.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListBodyFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ListBodyToJson(this, toJsonT);
}

@JsonSerializable()
class Paginate{
   @JsonKey(name: 'total')
   final int total;

  Paginate({required this.total});

  factory Paginate.fromJson(Map<String, dynamic> json) => _$PaginateFromJson(json);

  Map<String, dynamic> toJson() => _$PaginateToJson(this);
}
