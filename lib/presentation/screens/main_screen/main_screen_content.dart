import 'package:bus_driver/presentation/blocs/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:bus_driver/presentation/screens/navigation_bar/navigation_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainScreenContent extends StatelessWidget {
  const MainScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return BottomNavigationBarBloc();
    },
    child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
  builder: (context, state) {
    return Scaffold(
      body: BottomNavigationBarBloc.getObject(context).screen[BottomNavigationBarBloc.getObject(context).index],
   bottomNavigationBar: NavigationBarContent(),
    );
  },
),
    );
  }
}
