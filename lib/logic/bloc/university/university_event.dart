part of 'university_bloc.dart';

@immutable
abstract class UniversityEvent {}

// * List | Event

class RequestUniversityListEvent extends UniversityEvent {
  final PaginationRequest paginationRequest;
  RequestUniversityListEvent({
      required this.paginationRequest,
  });
}

class RequestDegreeListEvent extends UniversityEvent {}

class RequestLocationListEvent extends UniversityEvent {}

class RequestMajorListEvent extends UniversityEvent {}

class RequestTypesListEvent extends UniversityEvent {}

// * University Overview | Event

class RequestUniversityOverviewEvent extends UniversityEvent {
  final int id;
  RequestUniversityOverviewEvent({
      required this.id,
  });
}