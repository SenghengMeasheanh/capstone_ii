import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'career_event.dart';
part 'career_state.dart';

class CareerBloc extends Bloc<CareerEvent, CareerState> {
  // * Init Repo
  final _careerRepo = CareerRepo();
  CareerBloc() : super(CareerInitial()) {
    // * List | Bloc
    on<RequestCareerTypeListEvent>(_requestCareerTypeList);
  }

  Future<void> _requestCareerTypeList(
    RequestCareerTypeListEvent event,
    Emitter<CareerState> emit,
  ) async {
    // * Get Result
    final result = _careerRepo.getCareerTypeList();
    // * Check Result
    await result.then((response) {
      // * If Status Code = 200
      if (response.header.statusCode == 200) {
        // * Emit Success State
        emit(RequestCareerTypeListSuccessState(response: response));
      } else {
        // * Emit Error State
        emit(RequestCareerTypeListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        await Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestCareerTypeListEvent());
        // * Return
        return;
      }
    });
  }
}
