import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  // * Repository
  final _universityRepo = UniversityRepo();
  UniversityBloc() : super(UniversityInitial()) {
    // * List | Bloc
    on<RequestUniversityListEvent>(_requestUniversityList);
    on<RequestDegreeListEvent>(_requestDegreeList);
    on<RequestLocationListEvent>(_requestLocationList);
    on<RequestMajorListEvent>(_requestMajorList);
    on<RequestTypesListEvent>(_requestTypesList);
    on<RequestUniversityDegreeLevelsListEvent>(_requestUniversityDegreeLevelsList);
    on<RequestUniversityMajorListEvent>(_requestUniversityMajorList);
    on<RequestUniversitySpecializeListEvent>(_requestUniversitySpecializeList);
    // * University Overview | Bloc
    on<RequestUniversityOverviewEvent>(_requestUniversityOverview);
    // * University Admission | Bloc
    on<RequestUniversityAdmissionEvent>(_requestUniversityAdmission);
    // * University Major Detail | Bloc
    on<RequestUniversityMajorDetailEvent>(_requestUniversityMajorDetail);
    // * University Specialize Detail | Bloc
    on<RequestUniversitySpecializeDetailEvent>(_requestUniversitySpecializeDetail);
  }

  Future<void> _requestUniversityList(
    RequestUniversityListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversityList(
      search: event.paginationRequest.search,
      limit: event.paginationRequest.limit,
      page: event.paginationRequest.page,
      degree: event.paginationRequest.degree,
      location: event.paginationRequest.location,
      major: event.paginationRequest.major,
      type: event.paginationRequest.type,
    );
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestUniversityListSuccessState(response: response));
        } else {
          emit(RequestUniversityListErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Await 5 Seconds
          await Future.delayed(const Duration(seconds: 5));
          // * Call Event Again
          add(RequestUniversityListEvent(paginationRequest: event.paginationRequest));
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestDegreeList(
    RequestDegreeListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getDegreeList();
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestDegreeListSuccessState(response: response));
        } else {
          emit(RequestDegreeListErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Await 5 Seconds
          await Future.delayed(const Duration(seconds: 5));
          // * Call Event Again
          add(RequestDegreeListEvent());
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestLocationList(
    RequestLocationListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getLocationList();
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestLocationListSuccessState(response: response));
        } else {
          emit(RequestLocationListErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Await 5 Seconds
          await Future.delayed(const Duration(seconds: 5));
          // * Call Event Again
          add(RequestLocationListEvent());
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestMajorList(
    RequestMajorListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getMajorList();
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestMajorListSuccessState(response: response));
        } else {
          emit(RequestMajorListErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Await 5 Seconds
          await Future.delayed(const Duration(seconds: 5));
          // * Call Event Again
          add(RequestMajorListEvent());
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestTypesList(
    RequestTypesListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getTypeList();
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestTypeListSuccessState(response: response));
        } else {
          emit(RequestTypeListErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Await 5 Seconds
          await Future.delayed(const Duration(seconds: 5));
          // * Call Event Again
          add(RequestTypesListEvent());
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestUniversityOverview(
    RequestUniversityOverviewEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversityOverview(id: event.id);
    // * Check Result
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestUniversityOverviewSuccessState(response: response));
      } else {
        emit(RequestUniversityOverviewErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestUniversityOverviewErrorState());
        // * Return
        return;
      }
    });
  }

  Future<void> _requestUniversityAdmission(
    RequestUniversityAdmissionEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversityAdmission(id: event.id);
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestUniversityAdmissionSuccessState(response: response));
        } else {
          emit(RequestUniversityAdmissionErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Emit Error State
          emit(RequestUniversityAdmissionErrorState());
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestUniversityDegreeLevelsList(
    RequestUniversityDegreeLevelsListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversityDegreeLevelsList(id: event.id);
    // * Check Result
    await result.then(
      (response) {
        if (response.header.statusCode == 200) {
          emit(RequestUniversityDegreeLevelsListSuccessState(response: response));
        } else {
          emit(RequestUniversityDegreeLevelsListErrorState());
        }
      },
      onError: (exception, stackTrace) async {
        // * Debug Print Error
        debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
        // * If Server Not Response
        if (exception is DioException) {
          // * Await 5 Seconds
          await Future.delayed(const Duration(seconds: 5));
          // * Call Event Again
          add(RequestUniversityDegreeLevelsListEvent(id: event.id));
          // * Return
          return;
        }
      },
    );
  }

  Future<void> _requestUniversityMajorList(
    RequestUniversityMajorListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversityMajorList(
      id: event.id,
      degreeLevel: event.degreeLevel,
    );
    // * Check Result
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestUniversityMajorListSuccessState(response: response));
      } else {
        emit(RequestUniversityMajorListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        await Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestUniversityMajorListEvent(id: event.id, degreeLevel: event.degreeLevel));
        // * Return
        return;
      }
    });
  }

  Future<void> _requestUniversitySpecializeList(
    RequestUniversitySpecializeListEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversitySpecializeList(
      id: event.id,
      degreeLevel: event.degreeLevel,
    );
    // * Check Result
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestUniversitySpecializeListSuccessState(response: response));
      } else {
        emit(RequestUniversitySpecializeListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        await Future.delayed(const Duration(seconds: 5));
        // * Emit Error State
        add(RequestUniversitySpecializeListEvent(id: event.id, degreeLevel: event.degreeLevel));
        // * Return
        return;
      }
    });
  }

  Future<void> _requestUniversityMajorDetail(
    RequestUniversityMajorDetailEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversityMajorDetail(id: event.id);
    // * Check Result
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestUniversityMajorDetailSuccessState(response: response));
      } else {
        emit(RequestUniversityMajorDetailErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Call Event Again
        emit(RequestUniversityMajorDetailErrorState());
        // * Return
        return;
      }
    });
  }

  Future<void> _requestUniversitySpecializeDetail(
    RequestUniversitySpecializeDetailEvent event,
    Emitter<UniversityState> emit,
  ) async {
    // * Get Result
    final result = _universityRepo.getUniversitySpecializeDetail(id: event.id);
    // * Check Result
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestUniversitySpecializeDetailSuccessState(response: response));
      } else {
        emit(RequestUniversitySpecializeDetailErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestUniversitySpecializeDetailErrorState());
        // * Return
        return;
      }
    });
  }
}
