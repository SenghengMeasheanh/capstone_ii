import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'financial_aid_event.dart';
part 'financial_aid_state.dart';

class FinancialAidBloc extends Bloc<FinancialAidEvent, FinancialAidState> {
  FinancialAidBloc() : super(FinancialAidInitial()) {
    // * List | Bloc
    on<RequestFinancialAidListEvent>(_requestFinancialAidList);
    on<RequestFinancialAidMoreArticlesListEvent>(_requestFinancialAidMoreArticlesList);
    // * Financial Aid Detail | Bloc
    on<RequestFinancialAidDetailEvent>(_requestFinancialAidDetail);
  }
  // * Repo
  final _financialAidRepo = FinancialAidRepo();
  Future<void> _requestFinancialAidList(
    RequestFinancialAidListEvent event,
    Emitter<FinancialAidState> emit,
  ) async {
    // * Get Result
    final result = _financialAidRepo.getFinancialAidList(
      search: event.paginationRequest.search,
      limit: event.paginationRequest.limit,
      page: event.paginationRequest.page,
    );
    // * Check Result
    await result.then((response) {
      // * If Status Code = 200
      if (response.header.statusCode == 200) {
        // * Emit Success State
        emit(RequestFinancialAidListSuccessState(response: response));
      } else {
        // * Emit Error State
        emit(RequestFinancialAidListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        await Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestFinancialAidListEvent(paginationRequest: event.paginationRequest));
        // * Return
        return;
      }
    });
  }

  Future<void> _requestFinancialAidDetail(
    RequestFinancialAidDetailEvent event,
    Emitter<FinancialAidState> emit,
  ) async {
    // * Get Result
    final result = _financialAidRepo.getFinancialAidDetail(id: event.id);
    // * Check Result
    await result.then((response) {
      // * If Status Code = 200
      if (response.header.statusCode == 200) {
        // * Emit Success State
        emit(RequestFinancialAidDetailSuccessState(response: response));
      } else {
        // * Emit Error State
        emit(RequestFinancialAidListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestFinancialAidListErrorState());
        // * Return
        return;
      }
    });
  }

  Future<void> _requestFinancialAidMoreArticlesList(
    RequestFinancialAidMoreArticlesListEvent event,
    Emitter<FinancialAidState> emit,
  ) async {
    // * Get Result
    final result = _financialAidRepo.getFinancialAidMoreArticlesList(id: event.id);
    // * Check Result
    await result.then((response) {
      // * If Status Code = 200
      if (response.header.statusCode == 200) {
        // * Emit Success State
        emit(RequestFinancialAidMoreArticlesListSuccessState(response: response));
      } else {
        // * Emit Error State
        emit(RequestFinancialAidMoreArticlesListErrorState());
      }
    }, onError: (exception, stackTrace) async {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Await 5 Seconds
        await Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestFinancialAidMoreArticlesListEvent(id: event.id));
        // * Return
        return;
      }
    });
  }
}
