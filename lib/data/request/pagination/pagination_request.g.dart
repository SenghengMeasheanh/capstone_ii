// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) =>
    PaginationRequest()
      ..page = (json['page'] as num?)?.toInt()
      ..limit = (json['limit'] as num?)?.toInt()
      ..search = json['search'] as String?;

Map<String, dynamic> _$PaginationRequestToJson(PaginationRequest instance) {
  final val = <String, dynamic>{
    'page': instance.page,
    'limit': instance.limit,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('search', instance.search);
  return val;
}
