part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {
}
class BottomNavigationBarEventChange extends BottomNavigationBarEvent{
final int index;

BottomNavigationBarEventChange({required this.index});
}

