import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:capstone_ii/data/data_export.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // * Init Repository
  final _authRepo = AuthRepo();

  AuthBloc() : super(AuthInitial()) {
    // * Sign Up | Bloc
    on<RequestSignUpEvent>(_onRequestSignUp);
    // * Sign In | Bloc
    on<RequestSignInEvent>(_onRequestSignIn);
    // * Profile | Bloc
    on<RequestProfileEvent>(_onRequestProfile);
    // * Update | Bloc
    on<RequestUpdateProfileEvent>(_onRequestUpdateProfile);
  }

  Future<void> _onRequestSignUp(
    RequestSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    // * Get Result
    final result = _authRepo.requestSignUp(signUpRequest: event.signUpRequest);
    // * Await Result
    await result.then((response) {
      // * Check Result
      if (response.header.statusCode == 200) {
        emit(RequestSignUpSuccessState(response: response, msg: response.header.message!));
      } else {
        emit(RequestSignUpErrorState(message: response.header.message!));
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestSignUpErrorState(message: servererrorMessage));
        // * Return
        return;
      }
    });
  }

  Future<void> _onRequestSignIn(
    RequestSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    // * Get Result
    final result = _authRepo.requestSignIn(signInRequest: event.signInRequest);
    // * Await Result
    await result.then((response) async {
      // * Check Result
      if (response.header.statusCode == 200) {
        // * Save Authentication Info
        await AppPreference.saveAccessToken(response.body!.token);
        await AppPreference.saveRefreshToken(response.body!.refreshToken);
        // * Save User Info
        await AppPreference.saveUser(response.body!.user);
        // * Emit Success State
        emit(RequestSignInSuccessState(response: response, msg: response.header.message!));
      } else {
        if (response.header.statusCode == 401) {
          emit(RequestSignInErrorState(message: response.header.message!));
        }
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestSignInErrorState(message: servererrorMessage));
        // * Return
        return;
      }
    });
  }

  Future<void> _onRequestProfile(
    RequestProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    // * Get Result
    final result = _authRepo.getProfile(id: event.id);
    // * Await Result
    await result.then((response) {
      // * Check Result
      if (response.header.statusCode == 200) {
        AppPreference.saveUser(response.body!.data);
        emit(RequestProfileSuccessState(response: response));
      } else {
        emit(RequestProfileErrorState());
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestProfileErrorState());
        // * Return
        return;
      }
    });
  }

  Future<void> _onRequestUpdateProfile(
    RequestUpdateProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    // * Get Result
    final result = _authRepo.requestUpdateProfile(
      id: event.id,
      profileUpdateRequest: event.profileUpdateRequest,
    );
    // * Await Result
    await result.then((response) {
      // * Check Result
      if (response.header.statusCode == 200) {
        emit(RequestUpdateProfileSuccessState());
      } else {
        emit(RequestUpdateProfileErrorState(message: servererrorMessage));
      }
    }, onError: (exception, stackTrace) {
      // * Debug Print Error
      debugPrint(getErrorContent(exception: exception, stackTrace: stackTrace));
      // * If Server Not Response
      if (exception is DioException) {
        // * Emit Error State
        emit(RequestUpdateProfileErrorState(message: servererrorMessage));
        // * Return
        return;
      }
    });
  }
}
