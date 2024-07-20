// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) =>
    PaginationRequest()
      ..page = (json['page'] as num?)?.toInt()
      ..limit = (json['limit'] as num?)?.toInt()
      ..search = json['search'] as String?
      ..degree = (json['degree'] as num?)?.toInt()
      ..location = (json['location'] as num?)?.toInt()
      ..type = (json['type'] as num?)?.toInt()
      ..major = (json['major'] as num?)?.toInt()
      ..category = (json['category'] as num?)?.toInt();

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
  writeNotNull('degree', instance.degree);
  writeNotNull('location', instance.location);
  writeNotNull('type', instance.type);
  writeNotNull('major', instance.major);
  writeNotNull('category', instance.category);
  return val;
}
