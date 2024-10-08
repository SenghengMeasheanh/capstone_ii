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

class RequestUniversityDegreeLevelsListEvent extends UniversityEvent {
  final int id;
  RequestUniversityDegreeLevelsListEvent({
      required this.id,
  });
}

class RequestUniversityMajorListEvent extends UniversityEvent {
  final int id;
  final int? degreeLevel;
  RequestUniversityMajorListEvent({
      required this.id,
      this.degreeLevel,
  });
}
class RequestUniversitySpecializeListEvent extends UniversityEvent {
  final int id;
  final int? degreeLevel;
  RequestUniversitySpecializeListEvent({
      required this.id,
      this.degreeLevel,
  });
}

class RequestUniversityTuitionListEvent extends UniversityEvent {
  final int id;
  RequestUniversityTuitionListEvent({
      required this.id,
  });
}

class RequestUniversityScholarshipListEvent extends UniversityEvent {
  final int id;
  RequestUniversityScholarshipListEvent({
      required this.id,
  });
}

class RequestUniversityEventListEvent extends UniversityEvent {
  final int id;
  RequestUniversityEventListEvent({
      required this.id,
  });
}

// * University Major Detail | Event
class RequestUniversityMajorDetailEvent extends UniversityEvent {
  final int id;
  RequestUniversityMajorDetailEvent({
      required this.id,
  });
}

// * University Specialize Detail | Event
class RequestUniversitySpecializeDetailEvent extends UniversityEvent {
  final int id;
  RequestUniversitySpecializeDetailEvent({
      required this.id,
  });
}

// * University Scholarship Detail | Event
class RequestUniversityScholarshipDetailEvent extends UniversityEvent {
  final int id;
  RequestUniversityScholarshipDetailEvent({
      required this.id,
  });
}

// * University Event Detail | Event
class RequestUniversityEventDetailEvent extends UniversityEvent {
  final int id;
  RequestUniversityEventDetailEvent({
      required this.id,
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

// * University Admission | Event
class RequestUniversityAdmissionEvent extends UniversityEvent {
  final int id;
  RequestUniversityAdmissionEvent({
      required this.id,
  });
}