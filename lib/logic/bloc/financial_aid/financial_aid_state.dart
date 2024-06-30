part of 'financial_aid_bloc.dart';

@immutable
abstract class FinancialAidState {}

final class FinancialAidInitial extends FinancialAidState {}

// * List | State
final class RequestFinancialAidListSuccessState extends FinancialAidState {
  final ListBodyResponse<FinancialAidModels> response;

  RequestFinancialAidListSuccessState({
    required this.response,
  });
}

final class RequestFinancialAidMoreArticlesListSuccessState extends FinancialAidState {
  final ListBodyResponse<FinancialAidModels> response;

  RequestFinancialAidMoreArticlesListSuccessState({
    required this.response,
  });
}

// * Financial Aid Detail | State
final class RequestFinancialAidDetailSuccessState extends FinancialAidState {
  final MapBodyResponse<FinancialAidDetailModels> response;

  RequestFinancialAidDetailSuccessState({
    required this.response,
  });
}


// ! List | State
final class RequestFinancialAidListErrorState extends FinancialAidState {}

final class RequestFinancialAidMoreArticlesListErrorState extends FinancialAidState {}

// ! Financial Aid | State 
final class RequestFinancialAidDetailErrorState extends FinancialAidState {}