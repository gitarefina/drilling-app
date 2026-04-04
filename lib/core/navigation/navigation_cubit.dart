import 'package:drilling_app/core/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavbarItem(NavbarItem item) {
    switch (item) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;

      case NavbarItem.history:
        emit(NavigationState(NavbarItem.history, 1));
        break;
    }
  }
}
