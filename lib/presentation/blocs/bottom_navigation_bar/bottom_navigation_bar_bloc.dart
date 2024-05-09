import 'package:bloc/bloc.dart';
import 'package:bus_driver/presentation/screens/home_screen/home_view.dart';
import 'package:bus_driver/presentation/screens/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_navigation_bar_event.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  static  BottomNavigationBarBloc getObject(context)=>BlocProvider.of(context);
  int index = 0;
  List<Widget> screen = [HomeView(),SettingView()];

  BottomNavigationBarBloc() : super(InitialBottomNavigationBarState()) {
    on<BottomNavigationBarEventChange>((event, emit) {
      index = event.index;
      emit(BottomNavigationBarStateChange());
    });
  }
}
