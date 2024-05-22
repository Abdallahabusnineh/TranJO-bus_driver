import 'package:bus_driver/presentation/screens/policy/policy_content.dart';
import 'package:flutter/material.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PolicyContent(),
    );
  }
}
