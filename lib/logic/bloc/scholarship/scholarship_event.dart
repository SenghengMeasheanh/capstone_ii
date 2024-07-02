part of 'scholarship_bloc.dart';

@immutable
abstract class ScholarshipEvent {}

// * List | Event
class RequestScholarshipListEvent extends ScholarshipEvent {
  final PaginationRequest paginationRequest;

  RequestScholarshipListEvent({required this.paginationRequest});
}

// * Scholarship Detail | Event
class RequestScholarshipDetailEvent extends ScholarshipEvent {
  final int id;

  RequestScholarshipDetailEvent({required this.id});
}