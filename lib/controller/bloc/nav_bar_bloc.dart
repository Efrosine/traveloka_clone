import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(NavBarInitial(tabIndex: 0)) {
    on<NavBarEvent>(_setTab);
  }

  FutureOr<void> _setTab(NavBarEvent event, Emitter<NavBarState> emit) {
    if (event is NavBarTabChangeEvt) {
      emit(NavBarInitial(tabIndex: event.tabIndex));
    }
  }
}
