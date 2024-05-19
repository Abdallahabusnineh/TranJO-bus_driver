import 'package:bus_driver/presentation/blocs/bottom_navigation_bar/bottom_navigation_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class NavigationBarContent extends StatelessWidget {
  const NavigationBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: GNav(
                padding: EdgeInsets.all(16),
                curve: Curves.bounceInOut,
                color: Colors.grey.shade700,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                activeColor: Colors.white,
                //backgroundColor: Colors.blue.shade700,
                tabBackgroundColor: Colors.blueGrey,
                gap: 30,
                iconSize: 35,
                tabs: [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(
                    icon: Icons.settings,
                    text: 'Setting',
                  ),
                ],
                onTabChange: (value) {
    BottomNavigationBarBloc.getObject(context).add(BottomNavigationBarEventChange(index: value));



                },
              ),
            );
      },
    );
  }
}
