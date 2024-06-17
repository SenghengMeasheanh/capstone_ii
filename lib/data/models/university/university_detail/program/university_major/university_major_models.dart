import 'package:capstone_ii/data/data_export.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university_major_models.g.dart';

@JsonSerializable()
class UniversityMajorModels {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'is_active')
  final int isActive;

  @JsonKey(name: 'major_name')
  final MajorModels majorName;

  @JsonKey(name: 'major_image')
  final String majorImage;

  UniversityMajorModels({
    required this.id,
    required this.isActive,
    required this.majorName,
    required this.majorImage,
  });

  factory UniversityMajorModels.fromJson(Map<String, dynamic> json) => _$UniversityMajorModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityMajorModelsToJson(this);
  
}
