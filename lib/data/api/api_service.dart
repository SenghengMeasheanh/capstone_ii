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

  // * Unversity Endpoint
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
  Future<ListBodyResponse<UniversityEventModels>> getUniversityEvent({
    @Path('id') required int id
  });

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
