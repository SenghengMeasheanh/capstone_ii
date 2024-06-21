import 'package:capstone_ii/data/data_export.dart';

class CareerRepo {
  Future<ListBodyResponse<CareerTypeModels>> getCareerTypeList() async {
    return await ApiService().getCareerTypeList();
  }
}