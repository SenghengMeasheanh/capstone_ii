part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

// * Sign Up | Event 
class RequestSignUpEvent extends AuthEvent {
  final SignUpRequest signUpRequest;

  RequestSignUpEvent({required this.signUpRequest});
}

// * Sign In | Event
class RequestSignInEvent extends AuthEvent {
  final SignInRequest signInRequest;

  RequestSignInEvent({required this.signInRequest});
}

// * Profile | Event 
class RequestProfileEvent extends AuthEvent {
  final int id;

  RequestProfileEvent({required this.id});
} 

// * Update Profile | Event
class RequestUpdateProfileEvent extends AuthEvent {
  final int id;
  final ProfileUpdateRequest profileUpdateRequest;

  RequestUpdateProfileEvent({
    required this.id,
    required this.profileUpdateRequest,
  });
}


