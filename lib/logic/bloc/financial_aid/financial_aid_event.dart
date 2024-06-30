part of 'financial_aid_bloc.dart';

@immutable
abstract class FinancialAidEvent {}

// * List | Event
class RequestFinancialAidListEvent extends FinancialAidEvent {
  final PaginationRequest paginationRequest;

  RequestFinancialAidListEvent({
    required this.paginationRequest,
  });
}

class RequestFinancialAidMoreArticlesListEvent extends FinancialAidEvent {
  final int id;

  RequestFinancialAidMoreArticlesListEvent({
    required this.id,
  });
}

// * Financial Detail | Event
class RequestFinancialAidDetailEvent extends FinancialAidEvent {
  final int id;

  RequestFinancialAidDetailEvent({
    required this.id,
  });
}
