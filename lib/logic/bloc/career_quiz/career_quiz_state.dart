part of 'career_quiz_bloc.dart';

@immutable
abstract class CareerQuizState {}

final class CareerQuizInitial extends CareerQuizState {}

// * List | State
final class RequestCareerQuizListSuccessState extends CareerQuizState {
  final ListBodySecureResponse<CareerQuizModels> response;
  RequestCareerQuizListSuccessState({required this.response});
}

// ! List | State
final class RequestCareerQuizListErrorState extends CareerQuizState {}
