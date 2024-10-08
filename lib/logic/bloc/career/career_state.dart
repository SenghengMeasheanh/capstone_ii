part of 'career_bloc.dart';

@immutable
sealed class CareerState {}

final class CareerInitial extends CareerState {}

// * List | State
class RequestCareerListSuccessState extends CareerState {
  final ListBodyResponse<CareerModels> response;

  RequestCareerListSuccessState({required this.response});
}

class RequestCareerTypeListSuccessState extends CareerState{
  final ListBodyResponse<CareerTypeModels> response;

  RequestCareerTypeListSuccessState({required this.response});
}

// * Career Detail | State
class RequestCareerDetailSuccessState extends CareerState {
  final MapBodyResponse<CareerDetailModels> response;

  RequestCareerDetailSuccessState({required this.response});
}


// ! List | State
class RequestCareerListErrorState extends CareerState{}

class RequestCareerTypeListErrorState extends CareerState{}

// ! Career Detail | State
class RequestCareerDetailErrorState extends CareerState{}