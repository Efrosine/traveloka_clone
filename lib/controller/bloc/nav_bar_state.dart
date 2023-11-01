part of 'nav_bar_bloc.dart';

@immutable
sealed class NavBarState {
  final int tabIndex;

  NavBarState({required this.tabIndex});
}

final class NavBarInitial extends NavBarState {
  NavBarInitial({required super.tabIndex});
}
