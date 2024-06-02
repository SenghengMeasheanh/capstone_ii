part of 'university_bloc.dart';

@immutable
abstract class UniversityState {}

class UniversityInitial extends UniversityState {}

// * List | State
class RequestUniversityListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityModels> response;

  RequestUniversityListSuccessState({required this.response});
}

class RequestDegreeListSuccessState extends UniversityState {
  final ListBodyResponse<DegreeModels> response;

  RequestDegreeListSuccessState({required this.response});
}

class RequestLocationListSuccessState extends UniversityState {
  final ListBodyResponse<LocationModels> response;

  RequestLocationListSuccessState({required this.response});
}
class RequestMajorListSuccessState extends UniversityState {
  final ListBodyResponse<MajorModels> response;

  RequestMajorListSuccessState({required this.response});
}

class RequestTypeListSuccessState extends UniversityState {
  final ListBodyResponse<TypeModels> response;

  RequestTypeListSuccessState({required this.response});
}


// ! List | State
class RequestUniversityListErrorState extends UniversityState {}

class RequestDegreeListErrorState extends UniversityState {}

class RequestLocationListErrorState extends UniversityState {}

class RequestMajorListErrorState extends UniversityState {}

class RequestTypeListErrorState extends UniversityState {}