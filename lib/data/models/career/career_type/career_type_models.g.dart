// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_type_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerTypeModels _$CareerTypeModelsFromJson(Map<String, dynamic> json) =>
    CareerTypeModels(
      id: (json['id'] as num).toInt(),
      nameKh: json['name_kh'] as String,
      nameEn: json['name_en'] as String,
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CareerTypeModelsToJson(CareerTypeModels instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name_kh': instance.nameKh,
    'name_en': instance.nameEn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_active', instance.isActive);
  return val;
}
