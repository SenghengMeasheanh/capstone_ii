part of 'career_bloc.dart';

@immutable
abstract class CareerEvent {}

// * List | Event
class RequestCareerListEvent extends CareerEvent {
  final PaginationRequest paginationRequest;
  final int? type;
  RequestCareerListEvent({
    required this.paginationRequest,
    this.type,
  });
}

class RequestCareerTypeListEvent extends CareerEvent {}
