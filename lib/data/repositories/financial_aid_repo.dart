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

  Future<MapBodyResponse<FinancialAidDetailModels>> getFinancialAidDetail({
    required int id,
  }) async {
    return await ApiService().getFinancialAidDetail(id: id);
  }

  Future<ListBodyResponse<FinancialAidModels>> getFinancialAidMoreArticlesList({
    required int id,
  }) async {
    return await ApiService().getFinancialAidMoreArticlesList(id: id);
  }
}
