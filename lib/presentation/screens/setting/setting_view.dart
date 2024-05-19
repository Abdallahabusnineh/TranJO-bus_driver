import 'package:bus_driver/presentation/blocs/logout/logout_bloc.dart';
import 'package:bus_driver/presentation/screens/setting/setting_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locater.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutBloc(sl()),
      child: Scaffold(
        body: SettingContent(),
      ),
    );
  }
}
