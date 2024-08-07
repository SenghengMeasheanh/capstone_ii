import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:capstone_ii/data/data_export.dart';

part 'api_service_secure.g.dart';

@RestApi(baseUrl: '')
abstract class ApiServiceSecure {
  factory ApiServiceSecure({String? baseUrl}) {
    // * Init Dio
    final dio = Dio();
    // * Dio Logger Interceptors
    dio.interceptors.add(TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
        printResponseHeaders: false,
        printResponseData: true,
        printResponseMessage: true,
      ),
    ));
    // * Dio Option
    dio.options = BaseOptions(
      headers: {
        'Authorization': 'Bearer ${AppPreference.getAccessToken}',
        'Accept': 'application/json',
        'content-type': 'application/json',
      },
    );
    return _ApiServiceSecure(dio, baseUrl: baseUrl ?? Flavor.instance.apiURL);
  }
  // * Auth Endpoints
  @POST('/auth/user/refresh_token')
  Future<AuthResponse> requestRefreshToken();

  @GET('/profile/{id}')
  Future<MapBodySecureResponse<UserModels>> getProfile({
    @Path('id') required int id,
  });

  @PUT('/profile/{id}')
  Future<MapBodySecureResponse<UserModels>> requestUpdateProfile({
    @Path('id') required int id,
    @Body() required ProfileUpdateRequest profileUpdateRequest,
  });

  // * Career Quiz Endpoints
  @GET('/career_quiz')
  Future<ListBodySecureResponse<CareerQuizModels>> getCareerQuiz();

  @POST('/career_quiz')
  Future<ListBodySecureResponse<CareerQuizResultModels>> requestSubmitAnswer({
    @Body() required SubmitAnswerRequest submitAnswerRequest,
  });
}
