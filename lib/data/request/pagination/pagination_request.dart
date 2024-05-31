import 'package:json_annotation/json_annotation.dart';

part 'pagination_request.g.dart';

@JsonSerializable()
class PaginationRequest {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'limit')
  int? limit;

  @JsonKey(name: 'search', includeIfNull: false)
  String? search;


  PaginationRequest();

  factory PaginationRequest.fromJson(Map<String, dynamic> json) => _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);
}
