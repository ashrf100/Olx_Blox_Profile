part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitEvent extends HomeEvent {
  final BuildContext context;

  HomeInitEvent({required this.context});
}

class LoadNextSectionEvent extends HomeEvent {
  final int widgetsLength;

  LoadNextSectionEvent({required this.widgetsLength});
}
