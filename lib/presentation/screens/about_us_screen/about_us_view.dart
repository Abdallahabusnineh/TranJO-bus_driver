import 'package:bus_driver/presentation/screens/about_us_screen/about_us_content.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutUsContent(),
    );
  }
}
