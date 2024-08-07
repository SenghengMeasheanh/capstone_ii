part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

final class SettingsInitial extends SettingsState {}

// * Static Page | State

final class RequestStaticPageSuccessState extends SettingsState {
  final ListBodyResponse<StaticPagesModels> response;

  RequestStaticPageSuccessState({required this.response});
}

// ! Static Page | State

final class RequestStaticPageErrorState extends SettingsState {
  final String message;
  RequestStaticPageErrorState({required this.message});
}