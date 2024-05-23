import 'package:bus_driver/core/common_widgets/navigations_types.dart';
import 'package:bus_driver/core/common_widgets/show_toast.dart';
import 'package:bus_driver/core/services/services_locater.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/verification_bloc.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/verification_state.dart';
import 'package:bus_driver/presentation/screens/forgot_password/password_change_isdone/password_change_view.dart';
import 'package:bus_driver/presentation/screens/forgot_password/verification/verification_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationBloc>(),
      child: BlocListener<VerificationBloc, VerificationState>(
        listener: (context, state) {
      if(state is VerificationSuccessState) {
        navigateTo(context, PasswordChangeView());
        showToast(text: 'change password successfully', state: ToastState.SUCCESS);
      }
      else if (state is VerificationServerFailureState || state is VerificationErrorState  )
        showToast(text: 'your code is not correct', state: ToastState.ERROR);
      },

        child: Scaffold(
          body: VerificationContent(),
        ),
      ),
    );
  }
}
