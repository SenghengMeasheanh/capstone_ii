import 'package:capstone_ii/data/data_export.dart';

class UniversityRepo {

  Future<ListBodyResponse<UniversityModels>> getUniversityList({
    String? search,
    int? limit,
    int? page,
  }) async {
    return await ApiService().getUniversityList(
      search: search,
      limit: limit,
      page: page,
    );
  }
}