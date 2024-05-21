import 'package:bus_driver/presentation/screens/user_info/user_info_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locater.dart';
import '../../blocs/user_details/user_details_bloc.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailsBloc(sl())..add(GetUserDetails()),
      child: Scaffold(
        body: UserInfoContent(),
      ),
    );
  }
}
