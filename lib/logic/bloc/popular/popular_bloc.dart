import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularInitial()) {
    // * List  | Bloc
    on<RequestPopularUniversityListEvent>(_onRequestPopularUniversityList);
    on<RequestPopularCareerListEvent>(_onRequestPopularCareerList);
  }

  // * Init Repo
  final _popularRepo = PopularRepo();

  Future<void> _onRequestPopularUniversityList(
    RequestPopularUniversityListEvent event,
    Emitter<PopularState> emit,
  ) async {
    // * Get Result
    final result = _popularRepo.getPopularUniversityList();
    // * Check Result
    await result.then((response) {
      // * If Success
      if (response.header.statusCode == 200) {
        emit(RequestPopularUniversityListSuccessState(response: response));
      } else {
        // * If Error
        emit(RequestPopularUniversityListErrorState());
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Future Delay 5 Seconds
        Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestPopularUniversityListEvent());
        // * Return
        return;
      }
    });
  }

  Future<void> _onRequestPopularCareerList(
    RequestPopularCareerListEvent event,
    Emitter<PopularState> emit,
  ) async {
    // * Get Result
    final result = _popularRepo.getPopularCareerList();
    // * Check Result
    await result.then((response) {
      // * If Success
      if (response.header.statusCode == 200) {
        emit(RequestPopularCareerListSuccessState(response: response));
      } else {
        // * If Error
        emit(RequestPopularCareerListErrorState());
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Future Delay 5 Seconds
        Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestPopularCareerListEvent());
        // * Return
        return;
      }
    });
  }
}
