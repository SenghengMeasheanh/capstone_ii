part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

// * List | Event
class RequestEventsListEvent extends EventsEvent {
  final PaginationRequest paginationRequest;

  RequestEventsListEvent({required this.paginationRequest});
}

class RequestEventsCategoryListEvent extends EventsEvent {}