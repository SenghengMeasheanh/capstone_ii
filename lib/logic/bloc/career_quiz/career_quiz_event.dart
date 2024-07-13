part of 'career_quiz_bloc.dart';

@immutable
abstract class CareerQuizEvent {}

// * List | Response
class RequestCareerQuizListEvent extends CareerQuizEvent {
  RequestCareerQuizListEvent();
}
