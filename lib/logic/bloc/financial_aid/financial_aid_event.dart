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
