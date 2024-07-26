import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    // * Static | Bloc
    on<RequestStaticPageEvent>(_onRequestStaticPage);
  }

  // * Init Repo
  final _settingsRepo = SettingRepo();

  Future<void> _onRequestStaticPage(
    RequestStaticPageEvent event,
    Emitter<SettingsState> emit,
  ) async {
    // * Get Result
    final result = _settingsRepo.getStaticPages(alias: event.alias);
    // * Await Result
    await result.then((response) {
      // * Check Result
      if (response.header.statusCode == 200) {
        // * Emit Success
        emit(RequestStaticPageSuccessState(response: response));
      } else {
        // * Emit Error
        emit(RequestStaticPageErrorState());
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * Server Not Response
      if (exception is DioException) {
        // * Future Delay 5 Seconds
        Future.delayed(const Duration(seconds: 5));
        // * Call Event Again
        add(RequestStaticPageEvent(alias: event.alias));
      }
      // * Return
      return;
    });
  }
}
