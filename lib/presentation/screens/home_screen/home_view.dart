import 'package:bus_driver/presentation/screens/home_screen/home_content.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomeContent(),
    );
  }
}
