import 'package:bus_driver/core/common_widgets/navigations_types.dart';
import 'package:bus_driver/core/common_widgets/show_toast.dart';
import 'package:bus_driver/core/services/services_locater.dart';
import 'package:bus_driver/presentation/blocs/Login/login_bloc.dart';
import 'package:bus_driver/presentation/screens/login/login_content.dart';
import 'package:bus_driver/presentation/screens/main_screen/main_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(sl()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          print(state);
         if(state is LoginSuccessState){
         navigateTo(context, MainScreenView());
           showToast(text: state.r, state: ToastState.SUCCESS);
         }
         else if (state is LoginServerFailure)
           showToast(text: 'enter with correct value', state: ToastState.ERROR);

        },
        child: Scaffold(
            body: LoginContent()
        ),
      ),
    );
  }
}
