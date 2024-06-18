// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ListBodyResponse<UniversityModels>> getUniversityList({
    String? search,
    int? page,
    int? limit,
    int? major,
    int? degree,
    int? location,
    int? type,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'search': search,
      r'page': page,
      r'limit': limit,
      r'major': major,
      r'degree': degree,
      r'location': location,
      r'type': type,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<UniversityModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<UniversityModels>.fromJson(
      _result.data!,
      (json) => UniversityModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<MapBodyResponse<UniversityOverviewModels>> getUniversityOverview(
      {required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MapBodyResponse<UniversityOverviewModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/overview/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MapBodyResponse<UniversityOverviewModels>.fromJson(
      _result.data!,
      (json) => UniversityOverviewModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<UniversityAdmissionModels>> getUniversityAdmission(
      {required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<UniversityAdmissionModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/admission/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<UniversityAdmissionModels>.fromJson(
      _result.data!,
      (json) =>
          UniversityAdmissionModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<DegreeLevelsModels>> getUniversityDegreeLevelsList(
      {required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<DegreeLevelsModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/program/degreeLevel/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<DegreeLevelsModels>.fromJson(
      _result.data!,
      (json) => DegreeLevelsModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<UniversityMajorModels>> getUniversityMajorList({
    required int id,
    int? degreeLevel,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'degreeLevel': degreeLevel};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<UniversityMajorModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/program/major/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<UniversityMajorModels>.fromJson(
      _result.data!,
      (json) => UniversityMajorModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<MapBodyResponse<UniversityMajorDetailModels>> getUniversityMajorDetail(
      {required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MapBodyResponse<UniversityMajorDetailModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/program/major/detail/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MapBodyResponse<UniversityMajorDetailModels>.fromJson(
      _result.data!,
      (json) =>
          UniversityMajorDetailModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<UniversitySpecializeModels>>
      getUniversitySpecializeList({
    required int id,
    int? degreeLevel,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'degreeLevel': degreeLevel};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<UniversitySpecializeModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/program/specialize/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<UniversitySpecializeModels>.fromJson(
      _result.data!,
      (json) =>
          UniversitySpecializeModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<MapBodyResponse<UniversitySpecializeDetailModels>>
      getUniversitySpecializeDetail({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MapBodyResponse<UniversitySpecializeDetailModels>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/universities/program/specialize/detail/${id}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = MapBodyResponse<UniversitySpecializeDetailModels>.fromJson(
      _result.data!,
      (json) => UniversitySpecializeDetailModels.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<UniversityTuitionModels>> getUniversityTuition(
      {required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<UniversityTuitionModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/tuition/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<UniversityTuitionModels>.fromJson(
      _result.data!,
      (json) => UniversityTuitionModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<UniversityScholarshipModels>>
      getUniversityScholarship({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<UniversityScholarshipModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/universities/scholarships/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<UniversityScholarshipModels>.fromJson(
      _result.data!,
      (json) =>
          UniversityScholarshipModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<MapBodyResponse<UniversityScholarshipDetailModels>>
      getUniversityScholarshipDetail({required int id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MapBodyResponse<UniversityScholarshipDetailModels>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/universities/scholarship/detail/${id}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = MapBodyResponse<UniversityScholarshipDetailModels>.fromJson(
      _result.data!,
      (json) => UniversityScholarshipDetailModels.fromJson(
          json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<DegreeModels>> getDegreeList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<DegreeModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/getFilter/degrees',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<DegreeModels>.fromJson(
      _result.data!,
      (json) => DegreeModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<LocationModels>> getLocationList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<LocationModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/getFilter/locations',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<LocationModels>.fromJson(
      _result.data!,
      (json) => LocationModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<MajorModels>> getMajorList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<MajorModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/getFilter/majors',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<MajorModels>.fromJson(
      _result.data!,
      (json) => MajorModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListBodyResponse<TypeModels>> getTypeList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListBodyResponse<TypeModels>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/getFilter/types',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListBodyResponse<TypeModels>.fromJson(
      _result.data!,
      (json) => TypeModels.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
