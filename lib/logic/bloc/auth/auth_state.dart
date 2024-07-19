part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

// * Sign Up | State
final class RequestSignUpSuccessState extends AuthState {
  final AuthResponse response;
  final String msg;

  RequestSignUpSuccessState({required this.response, required this.msg});
}

// * Sign In | State
final class RequestSignInSuccessState extends AuthState {
  final AuthResponse response;
  final String msg;

  RequestSignInSuccessState({required this.response, required this.msg});
}

// ! Sign Up | State
final class RequestSignUpErrorState extends AuthState {
  final String message;

  RequestSignUpErrorState({required this.message});
}

// ! Sign In | State
final class RequestSignInErrorState extends AuthState {
  final String message;

  RequestSignInErrorState({required this.message});
}

