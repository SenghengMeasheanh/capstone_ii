part of 'university_bloc.dart';

@immutable
abstract class UniversityState {}

class UniversityInitial extends UniversityState {}


// * List | State
class RequestUniversityListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityModels> response;

  RequestUniversityListSuccessState({required this.response});

}

// ! List | State
class RequestUniversityListErrorState extends UniversityState {} 
