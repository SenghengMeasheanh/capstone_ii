import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'career_quiz_event.dart';
part 'career_quiz_state.dart';

class CareerQuizBloc extends Bloc<CareerQuizEvent, CareerQuizState> {
  CareerQuizBloc() : super(CareerQuizInitial()) {
    // * List | Bloc
    on<RequestCareerQuizListEvent>(_onRequestCareerQuizList);
  }
  // * Init Repo
  final _careerQuizRepo = CareerQuizRepo();

  Future<void> _onRequestCareerQuizList(RequestCareerQuizListEvent event, Emitter<CareerQuizState> emit) async {
    // * Get Result
    final result = _careerQuizRepo.getCareerQuiz();
    // * Check Result
    await result.then((response) {
      // * If Status Code =  200
      if (response.header.statusCode == 200) {
        // * Emit Success
        emit(RequestCareerQuizListSuccessState(response: response));
      } else {
        // * Emit Error
        emit(RequestCareerQuizListErrorState());
      }
    }, onError: (exception, stackTrace) {
      // * Print Debug Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestCareerQuizListEvent());
        // * Return
        return;
      }
    });
  }
}
