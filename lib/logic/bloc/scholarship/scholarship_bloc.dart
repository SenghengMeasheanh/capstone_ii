import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'scholarship_event.dart';
part 'scholarship_state.dart';

class ScholarshipBloc extends Bloc<ScholarshipEvent, ScholarshipState> {
  // * Scholarship Repo
  final _scholarshipRepo = ScholarshipRepo();

  ScholarshipBloc() : super(ScholarshipInitial()) {
    on<RequestScholarshipListEvent>(_onRequestScholarshipListEvent);
  }

  Future<void> _onRequestScholarshipListEvent(
    RequestScholarshipListEvent event,
    Emitter<ScholarshipState> emit,
  ) async {
    // * Get Result
    final result = _scholarshipRepo.getScholarshipList(
      search: event.paginationRequest.search,
      page: event.paginationRequest.page,
      limit: event.paginationRequest.limit,
    );
    // * Check Result
    await result.then((response) {
      // * If Status Code = 200
      if (response.header.statusCode == 200) {
        // * Emit Success State
        emit(RequestScholarshipListSuccessState(response: response));
      } else {
        // * Emit Error State
        emit(RequestScholarshipListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        await Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(
          RequestScholarshipListEvent(paginationRequest: event.paginationRequest),
        );
        // * Return
        return;
      }
    }
  );
  }
}
