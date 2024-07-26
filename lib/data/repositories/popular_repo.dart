import 'package:capstone_ii/data/data_export.dart';

class PopularRepo {
  Future<ListBodyResponse<UniversityModels>> getPopularUniversityList() async {
    return await ApiService().getPopularUniversityList();
  }

  Future<ListBodyResponse<CareerModels>> getPopularCareerList() async {
    return await ApiService().getPopularCareerList();
  } 
}
