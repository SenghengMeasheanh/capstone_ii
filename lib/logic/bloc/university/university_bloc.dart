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
  }

  Future<void> _requestUniversityList(RequestUniversityListEvent event, Emitter<UniversityState> emit) async {
    // * Get Result
    final result = _universityRepo.getUniversityList(
      search: event.paginationRequest.search,
      limit: event.paginationRequest.limit,
      page: event.paginationRequest.page,
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
}
