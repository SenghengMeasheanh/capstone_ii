part of 'scholarship_bloc.dart';

@immutable
abstract class ScholarshipState {}

final class ScholarshipInitial extends ScholarshipState {}

// * List | State
final class RequestScholarshipListSuccessState extends ScholarshipState {
  final ListBodyResponse<ScholarshipModels> response;

  RequestScholarshipListSuccessState({required this.response});
}

// * Scholarship Detail | State
final class RequestScholarshipDetailSuccessState extends ScholarshipState {
  final MapBodyResponse<ScholarshipDetailModels> response;

  RequestScholarshipDetailSuccessState({required this.response});
}

// ! List |State
final class RequestScholarshipListErrorState extends ScholarshipState {}

// ! Scholarship Detail | State
final class RequestScholarshipDetailErrorState extends ScholarshipState {}
