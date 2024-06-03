import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

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
          add(RequestUniversityListEvent(paginationRequest: event.paginationRequest, major: event.major, degree: event.degree, location: event.location, type: event.type));
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
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestDegreeListSuccessState(response: response));
      } else {
        emit(RequestDegreeListErrorState());
      }
    }, onError: (exception, stackTrace) async {
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
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestLocationListSuccessState(response: response));
      } else {
        emit(RequestLocationListErrorState());
      }
    }, onError: (exception, stackTrace) async {
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
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestMajorListSuccessState(response: response));
      } else {
        emit(RequestMajorListErrorState());
      }
    }, onError: (exception, stackTrace) async {
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
    await result.then((response) {
      if (response.header.statusCode == 200) {
        emit(RequestTypeListSuccessState(response: response));
      } else {
        emit(RequestTypeListErrorState());
      }
    }, onError: (exception, stackTrace) async {
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
}
