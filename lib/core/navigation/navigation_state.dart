import 'package:equatable/equatable.dart';

enum NavbarItem {
  home,
  history;

  String get value {
    switch (this) {
      case NavbarItem.home:
        return 'Home';
      case NavbarItem.history:
        return 'History';
    }
  }
}

 class NavigationState  extends Equatable{
final NavbarItem item;
final int Index;

const NavigationState(this.item,this.Index);


  @override
  List<Object?> get props => [item,Index];


}
