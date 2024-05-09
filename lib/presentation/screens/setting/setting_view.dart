import 'package:bus_driver/presentation/screens/setting/setting_content.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingContent(),
    );
  }
}
