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


}
