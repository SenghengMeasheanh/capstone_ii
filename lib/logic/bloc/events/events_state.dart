part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

final class EventsInitial extends EventsState {}

// * List | State
final class RequestEventsListSuceesState extends EventsState {
  final ListBodyResponse<EventModels> response;

  RequestEventsListSuceesState({required this.response});
}

final class RequestEventsCategoryListSuccessState extends EventsState {
  final ListBodyResponse<EventCategoryModels> response;

  RequestEventsCategoryListSuccessState({required this.response});
}

// *  Event Detail | State
final class RequestEventDetailSuccessState extends EventsState {
  final MapBodyResponse<EventDetailModels> response;

  RequestEventDetailSuccessState({required this.response});
}

// ! List | State
final class RequestEventsListErrorState extends EventsState {}

final class RequestEventsCategoryListErrorState extends EventsState {}

// ! Event Detail | State
final class RequestEventDetailErrorState extends EventsState {}
