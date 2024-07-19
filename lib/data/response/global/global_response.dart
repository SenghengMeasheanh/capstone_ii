import 'package:json_annotation/json_annotation.dart';

part 'global_response.g.dart';

@JsonSerializable()
class GlobalResponse {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final GlobalBody body;

  const GlobalResponse(
    this.header,
    this.body,
  );

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => _$GlobalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalResponseToJson(this);
}

@JsonSerializable()
class GlobalSecureResponse {
  @JsonKey(name: 'header')
  final GlobalHeader header;

  @JsonKey(name: 'body')
  final GlobalBody? body;

  const GlobalSecureResponse(
    this.header,
    this.body,
  );

  factory GlobalSecureResponse.fromJson(Map<String, dynamic> json) => _$GlobalSecureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalSecureResponseToJson(this);
}

@JsonSerializable()
class GlobalHeader {
  @JsonKey(name: 'statusCode')
  final int statusCode;

  @JsonKey(name: 'message')
  final String? message;

  const GlobalHeader(
    this.statusCode,
    this.message,
  );

  factory GlobalHeader.fromJson(Map<String, dynamic> json) => _$GlobalHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalHeaderToJson(this);
}

@JsonSerializable()
class GlobalBody {
  @JsonKey(name: 'status', includeIfNull: false)
  final dynamic status;

  @JsonKey(name: 'message', includeIfNull: false)
  final String? msg;

  @JsonKey(name: 'id', includeIfNull: false)
  final int? notificationCount;

  // ? For Payment
  @JsonKey(name: 'transactionId', includeIfNull: false)
  final String? transactionId;

  @JsonKey(name: 'token', includeIfNull: false)
  final String? token;

  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;

  const GlobalBody(
    this.status,
    this.msg,
    this.notificationCount,
    this.transactionId,
    this.token,
    this.refreshToken,
  );

  String get message => msg!;

  factory GlobalBody.fromJson(Map<String, dynamic> json) => _$GlobalBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalBodyToJson(this);
}
