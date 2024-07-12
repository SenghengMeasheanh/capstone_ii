// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModels _$UserModelsFromJson(Map<String, dynamic> json) => UserModels(
      name: json['name'] as String,
      gender: json['gender'] as String,
      birthday: json['birthday'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserModelsToJson(UserModels instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'email': instance.email,
    };
