import 'package:capstone_ii/data/data_export.dart';

class UniversityRepo {

  Future<ListBodyResponse<UniversityModels>> getUniversityList({
    String? search,
    int? limit,
    int? page,
    int? major,
    int? degree,
    int? location,
    int? type,
  }) async {
    return await ApiService().getUniversityList(
      search: search,
      limit: limit,
      page: page,
      major: major,
      degree: degree,
      location: location,
      type: type,
    );
  }

  Future<ListBodyResponse<DegreeModels>> getDegreeList() async {
    return await ApiService().getDegreeList();
  }

  Future<ListBodyResponse<LocationModels>> getLocationList() async {
    return await ApiService().getLocationList();
  }

  Future<ListBodyResponse<MajorModels>> getMajorList() async {
    return await ApiService().getMajorList();
  }

  Future<ListBodyResponse<TypeModels>> getTypeList() async {
    return await ApiService().getTypeList();
  }

  
}