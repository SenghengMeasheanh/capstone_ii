part of 'scholarship_bloc.dart';

@immutable
abstract class ScholarshipEvent {}

// * List
class RequestScholarshipListEvent extends ScholarshipEvent {
  final PaginationRequest paginationRequest;

  RequestScholarshipListEvent({required this.paginationRequest});
}
