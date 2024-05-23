import 'package:bus_driver/presentation/screens/forgot_password/password_change_isdone/password_change_content.dart';
import 'package:flutter/material.dart';

class PasswordChangeView extends StatelessWidget {
  const PasswordChangeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PasswordChangeContent(),
    );
  }
}
