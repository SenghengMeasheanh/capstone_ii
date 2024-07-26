part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

// * Static Page | Event
class RequestStaticPageEvent extends SettingsEvent {
  final String? alias;

  RequestStaticPageEvent({required this.alias});
}
