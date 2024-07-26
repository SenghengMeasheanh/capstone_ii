part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

final class PopularInitial extends PopularState {}

// * List |  State
final class RequestPopularUniversityListSuccessState extends PopularState {
  final ListBodyResponse<UniversityModels> response;

  RequestPopularUniversityListSuccessState({required this.response});
}

final class RequestPopularCareerListSuccessState extends PopularState {
  final ListBodyResponse<CareerModels> response;

  RequestPopularCareerListSuccessState({required this.response});
}

// ! List | State
final class RequestPopularUniversityListErrorState extends PopularState {}

final class RequestPopularCareerListErrorState extends PopularState {}
