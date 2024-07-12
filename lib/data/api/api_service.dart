import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: '')
abstract class ApiService {
  factory ApiService({String? baseUrl}) {
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
        'Accept': 'application/json',
        'content-type': 'application/json',
      },
    );
    return _ApiService(dio, baseUrl: baseUrl ?? Flavor.instance.apiURL);
  }
  // * Authention Endpoint
  @POST('/auth/user/register')
  Future<AuthResponse> requestSignUp({
    @Body() required SignUpRequest signUpRequest,
  });

  @POST('/auth/user/login')
  Future<AuthResponse> requestSignIn({
    @Body() required SignInRequest signInRequest,
  });

  // * Career Endpoint
  @GET('/careers')
  Future<ListBodyResponse<CareerModels>> getCareerList({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('type') int? type,
  });

  @GET('/careers/{id}')
  Future<MapBodyResponse<CareerDetailModels>> getCareerDetail({
    @Path('id') required int id,
  });

  @GET('/careers/types')
  Future<ListBodyResponse<CareerTypeModels>> getCareerTypeList();

  // * Financial Aid Endpoint
  @GET('/financial_aids')
  Future<ListBodyResponse<FinancialAidModels>> getFinancialAidList({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/financial_aids/{id}')
  Future<MapBodyResponse<FinancialAidDetailModels>> getFinancialAidDetail({
    @Path('id') required int id,
  });

  @GET('/financial_aids/more_articles/{id}')
  Future<ListBodyResponse<FinancialAidModels>> getFinancialAidMoreArticlesList({
    @Path('id') required int id,
  });

  // * Scholarship Endpoint
  @GET('/scholarships')
  Future<ListBodyResponse<ScholarshipModels>> getScholarshipList({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/scholarships/{id}')
  Future<MapBodyResponse<ScholarshipDetailModels>> getScholarshipDetail({
    @Path('id') required int id,
  });

  // * University Endpoint
  @GET('/universities')
  Future<ListBodyResponse<UniversityModels>> getUniversityList({
    @Query('search') String? search,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('major') int? major,
    @Query('degree') int? degree,
    @Query('location') int? location,
    @Query('type') int? type,
  });

  @GET('/universities/overview/{id}')
  Future<MapBodyResponse<UniversityOverviewModels>> getUniversityOverview({
    @Path('id') required int id,
  });

  @GET('/universities/admission/{id}')
  Future<ListBodyResponse<UniversityAdmissionModels>> getUniversityAdmission({
    @Path('id') required int id,
  });

  @GET('/universities/program/degreeLevel/{id}')
  Future<ListBodyResponse<DegreeLevelsModels>> getUniversityDegreeLevelsList({
    @Path('id') required int id,
  });

  @GET('/universities/program/major/{id}')
  Future<ListBodyResponse<UniversityMajorModels>> getUniversityMajorList({
    @Path('id') required int id,
    @Query('degreeLevel') int? degreeLevel,
  });

  @GET('/universities/program/major/detail/{id}')
  Future<MapBodyResponse<UniversityMajorDetailModels>> getUniversityMajorDetail({
    @Path('id') required int id,
  });

  @GET('/universities/program/specialize/{id}')
  Future<ListBodyResponse<UniversitySpecializeModels>> getUniversitySpecializeList({
    @Path('id') required int id,
    @Query('degreeLevel') int? degreeLevel,
  });

  @GET('/universities/program/specialize/detail/{id}')
  Future<MapBodyResponse<UniversitySpecializeDetailModels>> getUniversitySpecializeDetail({
    @Path('id') required int id,
  });

  @GET('/universities/tuition/{id}')
  Future<ListBodyResponse<UniversityTuitionModels>> getUniversityTuition({
    @Path('id') required int id,
  });

  @GET('/universities/scholarships/{id}')
  Future<ListBodyResponse<UniversityScholarshipModels>> getUniversityScholarship({
    @Path('id') required int id,
  });

  @GET('/universities/scholarship/detail/{id}')
  Future<MapBodyResponse<UniversityScholarshipDetailModels>> getUniversityScholarshipDetail({
    @Path('id') required int id,
  });

  @GET('/universities/events/{id}')
  Future<ListBodyResponse<UniversityEventModels>> getUniversityEvent({@Path('id') required int id});

  @GET('/universities/event/detail/{id}')
  Future<MapBodyResponse<UniversityEventDetailModels>> getUniversityEventDetail({
    @Path('id') required int id,
  });

  @GET('/getFilter/degrees')
  Future<ListBodyResponse<DegreeModels>> getDegreeList();

  @GET('/getFilter/locations')
  Future<ListBodyResponse<LocationModels>> getLocationList();

  @GET('/getFilter/majors')
  Future<ListBodyResponse<MajorModels>> getMajorList();

  @GET('/getFilter/types')
  Future<ListBodyResponse<TypeModels>> getTypeList();
}
