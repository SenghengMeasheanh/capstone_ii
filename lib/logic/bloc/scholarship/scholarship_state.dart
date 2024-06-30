part of 'scholarship_bloc.dart';

@immutable
abstract class ScholarshipState {}

final class ScholarshipInitial extends ScholarshipState {}

// * List
final class RequestScholarshipListSuccessState extends ScholarshipState {
  final ListBodyResponse<ScholarshipModels> response;

  RequestScholarshipListSuccessState({required this.response});
}

// ! List
final class RequestScholarshipListErrorState extends ScholarshipState {}
