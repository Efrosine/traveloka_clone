part of 'nav_bar_bloc.dart';

@immutable
sealed class NavBarEvent {}

class NavBarTabChangeEvt extends NavBarEvent {
  final int tabIndex;

  NavBarTabChangeEvt({required this.tabIndex});
}
