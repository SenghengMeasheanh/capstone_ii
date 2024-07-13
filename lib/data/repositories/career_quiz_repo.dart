import 'package:capstone_ii/data/data_export.dart';

class CareerQuizRepo {
  Future<ListBodySecureResponse<CareerQuizModels>> getCareerQuiz() async {
     return await ApiServiceSecure().getCareerQuiz();
  }
}
