import 'package:capstone_ii/data/data_export.dart';

class CareerRepo {
  Future<ListBodyResponse<CareerModels>> getCareerList({
    String? search,
    int? limit,
    int? page,
    int? type,
  }) async {
    return await ApiService().getCareerList(
      search: search,
      limit: limit,
      page: page,
      type: type,
    );
  } 

  Future<MapBodyResponse<CareerDetailModels>> getCareerDetail(int id) async {
    return await ApiService().getCareerDetail(id: id);
  } 

  Future<ListBodyResponse<CareerTypeModels>> getCareerTypeList() async {
    return await ApiService().getCareerTypeList();
  }
}