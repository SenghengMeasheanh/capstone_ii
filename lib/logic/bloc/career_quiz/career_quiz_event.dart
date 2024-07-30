part of 'career_quiz_bloc.dart';

@immutable
abstract class CareerQuizEvent {}

// * List | Response
class RequestCareerQuizListEvent extends CareerQuizEvent {
  RequestCareerQuizListEvent();
}

class RequestSubmitAnswerEvent extends CareerQuizEvent {
  final SubmitAnswerRequest submitAnswerRequest;
  RequestSubmitAnswerEvent({
    required this.submitAnswerRequest,
  });
}


