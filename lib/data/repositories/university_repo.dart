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

  Future<MapBodyResponse<UniversityOverviewModels>> getUniversityOverview({
    required int id,
  }) async {
    return await ApiService().getUniversityOverview(id: id);
  }

  Future<ListBodyResponse<UniversityAdmissionModels>> getUniversityAdmission({
    required int id,
  }) async {
    return await ApiService().getUniversityAdmission(id: id);
  }

  Future<ListBodyResponse<DegreeLevelsModels>> getUniversityDegreeLevelsList({
    required int id,
  }) async {
    return await ApiService().getUniversityDegreeLevelsList(id: id);
  }

  Future<ListBodyResponse<UniversityMajorModels>> getUniversityMajorList({
    required int id,
    int? degreeLevel,
  }) async {
    return await ApiService().getUniversityMajorList(id: id, degreeLevel: degreeLevel);
  }

  Future<MapBodyResponse<UniversityMajorDetailModels>> getUniversityMajorDetail({
    required int id,
  }) async {
    return await ApiService().getUniversityMajorDetail(id: id);
  }

  Future<ListBodyResponse<UniversitySpecializeModels>> getUniversitySpecializeList({
    required int id,
    int? degreeLevel,
  }) async {
    return await ApiService().getUniversitySpecializeList(id: id, degreeLevel: degreeLevel);
  }

  Future<MapBodyResponse<UniversitySpecializeDetailModels>> getUniversitySpecializeDetail({
    required int id,
  }) async {
    return await ApiService().getUniversitySpecializeDetail(id: id);
  }

  Future<ListBodyResponse<UniversityTuitionModels>> getUniversityTuition({
    required int id,
  }) async {
    return await ApiService().getUniversityTuition(id: id);
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
