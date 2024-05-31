part of 'university_bloc.dart';

@immutable
abstract class UniversityEvent {}

// * List | Event 

class RequestUniversityListEvent extends UniversityEvent {
  final PaginationRequest paginationRequest;

  RequestUniversityListEvent({required this.paginationRequest});
}
