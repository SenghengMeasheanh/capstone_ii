part of 'university_bloc.dart';

@immutable
abstract class UniversityState {}

class UniversityInitial extends UniversityState {}

// * List | State
class RequestUniversityListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityModels> response;

  RequestUniversityListSuccessState({required this.response});
}

class RequestUniversityDegreeLevelsListSuccessState extends UniversityState {
  final ListBodyResponse<DegreeLevelsModels> response;

  RequestUniversityDegreeLevelsListSuccessState({required this.response});
}

class RequestUniversityMajorListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityMajorModels> response;

  RequestUniversityMajorListSuccessState({required this.response});
}

class RequestUniversitySpecializeListSuccessState extends UniversityState {
  final ListBodyResponse<UniversitySpecializeModels> response;

  RequestUniversitySpecializeListSuccessState({required this.response});
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

class RequestTuitionListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityTuitionModels> response;

  RequestTuitionListSuccessState({required this.response});
}

class RequestUniversityScholarshipListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityScholarshipModels> response;

  RequestUniversityScholarshipListSuccessState({required this.response});
}

class RequestUniversityEventListSuccessState extends UniversityState {
  final ListBodyResponse<UniversityEventModels> response;

  RequestUniversityEventListSuccessState({required this.response});
}

// * University Overview | State
class RequestUniversityOverviewSuccessState extends UniversityState {
  final MapBodyResponse<UniversityOverviewModels> response;

  RequestUniversityOverviewSuccessState({required this.response});
}

// * University Admission | State
class RequestUniversityAdmissionSuccessState extends UniversityState {
  final ListBodyResponse<UniversityAdmissionModels> response;

  RequestUniversityAdmissionSuccessState({required this.response});
}

// * University Major Detail | State
class RequestUniversityMajorDetailSuccessState extends UniversityState {
  final MapBodyResponse<UniversityMajorDetailModels> response;

  RequestUniversityMajorDetailSuccessState({required this.response});
}

// * University Specialize Detail | State
class RequestUniversitySpecializeDetailSuccessState extends UniversityState {
  final MapBodyResponse<UniversitySpecializeDetailModels> response;

  RequestUniversitySpecializeDetailSuccessState({required this.response});
}

// * University Scholarship Detail | State
class RequestUniversityScholarshipDetailSuccessState extends UniversityState {
  final MapBodyResponse<UniversityScholarshipDetailModels> response;

  RequestUniversityScholarshipDetailSuccessState({required this.response});
}

// * University Event Detail | State
class RequestUniversityEventDetailSuccessState extends UniversityState {
  final MapBodyResponse<UniversityEventDetailModels> response;

  RequestUniversityEventDetailSuccessState({required this.response});
}

// ! List | State
class RequestUniversityListErrorState extends UniversityState {}

class RequestUniversityDegreeLevelsListErrorState extends UniversityState {}

class RequestUniversityMajorListErrorState extends UniversityState {}

class RequestUniversitySpecializeListErrorState extends UniversityState {}

class RequestDegreeListErrorState extends UniversityState {}

class RequestLocationListErrorState extends UniversityState {}

class RequestMajorListErrorState extends UniversityState {}

class RequestTypeListErrorState extends UniversityState {}

class RequestTuitionListErrorState extends UniversityState {}

class RequestUniversityScholarshipListErrorState extends UniversityState {}

class RequestUniversityEventListErrorState extends UniversityState {}

// ! University Overview | State
class RequestUniversityOverviewErrorState extends UniversityState {}

// ! University Admission | State
class RequestUniversityAdmissionErrorState extends UniversityState {}

// ! Major Detail | State
class RequestUniversityMajorDetailErrorState extends UniversityState {}

// ! Specialize Detail | State
class RequestUniversitySpecializeDetailErrorState extends UniversityState {}

// ! Scholarship Detail | State
class RequestUniversityScholarshipDetailErrorState extends UniversityState {}

// ! Event Detail | State
class RequestUniversityEventDetailErrorState extends UniversityState {}