import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    on<RequestEventsListEvent>(_onRequestEventsList);
  }

  // * Event Repo
  final _eventRepo = EventRepo();

  Future<void> _onRequestEventsList(
    RequestEventsListEvent event,
    Emitter<EventsState> emit,
  ) async {
    // * Get Result
    final result = _eventRepo.getEventList(
      search: event.paginationRequest.search,
      page: event.paginationRequest.page,
      limit: event.paginationRequest.limit,
      category: event.paginationRequest.category,
    );

    // * Await Result
    await result.then((response) {
      // * Check Result
      if (response.header.statusCode == 200) {
        // * Emit Success
        emit(RequestEventsListSuceesState(response: response));
      } else {
        // * Emit Error
        emit(RequestEventsListErrorState());
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Delay 5 Second
        Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestEventsListEvent(paginationRequest: event.paginationRequest));
        // *  Return
        return;
      }
    });
  }
}
