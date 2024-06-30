import 'package:capstone_ii/data/data_export.dart';

class ScholarshipRepo {
  Future<ListBodyResponse<ScholarshipModels>> getScholarshipList({
    String? search,
    int? page,
    int? limit,
  }) async {
    return await ApiService().getScholarshipList(
      search: search,
      page: page,
      limit: limit,
    );
  }
}