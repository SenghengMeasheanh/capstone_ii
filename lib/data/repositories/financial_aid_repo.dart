import 'package:capstone_ii/data/data_export.dart';

class FinancialAidRepo {
  Future<ListBodyResponse<FinancialAidModels>> getFinancialAidList({
    String? search,
    int? limit,
    int? page,
  }) async {
    return await ApiService().getFinancialAidList(
      search: search,
      limit: limit,
      page: page,
    );
  }
}
