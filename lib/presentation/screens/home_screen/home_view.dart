import 'package:bus_driver/presentation/blocs/driver_control_bloc/driver_control_bloc.dart';
import 'package:bus_driver/presentation/screens/home_screen/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locater.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
    );
  }
}
