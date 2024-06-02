part of 'university_bloc.dart';

@immutable
abstract class UniversityEvent {}

// * List | Event

class RequestUniversityListEvent extends UniversityEvent {
  final PaginationRequest paginationRequest;
  final int? major;
  final int? degree;
  final int? location;
  final int? type;

  RequestUniversityListEvent({
      required this.paginationRequest,
      this.major,
      this.degree,
      this.location,
      this.type,
  });
}

class RequestDegreeListEvent extends UniversityEvent {}

class RequestLocationListEvent extends UniversityEvent {}

class RequestMajorListEvent extends UniversityEvent {}

class RequestTypesListEvent extends UniversityEvent {}
