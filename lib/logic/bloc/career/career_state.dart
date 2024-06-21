part of 'career_bloc.dart';

@immutable
sealed class CareerState {}

final class CareerInitial extends CareerState {}

// * List | State
class RequestCareerTypeListSuccessState extends CareerState{
  final ListBodyResponse<CareerTypeModels> response;

  RequestCareerTypeListSuccessState({required this.response});
}


// ! List | State
class RequestCareerTypeListErrorState extends CareerState{}