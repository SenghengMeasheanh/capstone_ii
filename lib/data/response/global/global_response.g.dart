// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalResponse _$GlobalResponseFromJson(Map<String, dynamic> json) =>
    GlobalResponse(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      GlobalBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalResponseToJson(GlobalResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

GlobalSecureResponse _$GlobalSecureResponseFromJson(
        Map<String, dynamic> json) =>
    GlobalSecureResponse(
      GlobalHeader.fromJson(json['header'] as Map<String, dynamic>),
      json['body'] == null
          ? null
          : GlobalBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalSecureResponseToJson(
        GlobalSecureResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

GlobalHeader _$GlobalHeaderFromJson(Map<String, dynamic> json) => GlobalHeader(
      (json['statusCode'] as num).toInt(),
      json['message'] as String?,
    );

Map<String, dynamic> _$GlobalHeaderToJson(GlobalHeader instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

GlobalBody _$GlobalBodyFromJson(Map<String, dynamic> json) => GlobalBody(
      json['status'],
      json['message'] as String?,
      (json['id'] as num?)?.toInt(),
      json['transactionId'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$GlobalBodyToJson(GlobalBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('message', instance.msg);
  writeNotNull('id', instance.notificationCount);
  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('token', instance.token);
  return val;
}
