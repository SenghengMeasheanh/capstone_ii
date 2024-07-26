part of 'popular_bloc.dart';

@immutable
abstract class PopularEvent {}

// * List | Event
class RequestPopularUniversityListEvent extends PopularEvent {}

class RequestPopularCareerListEvent extends PopularEvent {}
