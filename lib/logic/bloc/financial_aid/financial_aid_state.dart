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


// ! List | State
final class RequestFinancialAidListErrorState extends FinancialAidState {}