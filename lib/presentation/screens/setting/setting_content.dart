import 'package:bus_driver/core/common_widgets/navigations_types.dart';
import 'package:bus_driver/core/utils/app_const.dart';
import 'package:bus_driver/presentation/blocs/driver_control_bloc/driver_control_bloc.dart';
import 'package:bus_driver/presentation/blocs/logout/logout_bloc.dart';
import 'package:bus_driver/presentation/screens/about_us_screen/about_us_view.dart';
import 'package:bus_driver/presentation/screens/login/login_view.dart';
import 'package:bus_driver/presentation/screens/policy/policy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common_widgets/show_toast.dart';
import '../../../core/services/services_locater.dart';
import '../user_info/user_info_view.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* LogoutBloc blocLogout = BlocProvider.of<LogoutBloc>(context);
    LogoutBloc blocListenerLogOut = context.watch<LogoutBloc>();
*/
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Setting ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Icon(Icons.manage_accounts)),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: const Text(
                'Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        //abood alloooooo
        const Divider(
          endIndent: 15,
          indent: 15,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, const UserInfoView());
                },
                child: const Text(
                  'User Info',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, const UserInfoView());
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Icon(Icons.settings)),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: const Text(
                'Other Setting',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const Divider(
          endIndent: 15,
          indent: 15,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, PolicyView());
                },
                child: const Text(
                  'Policy',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  navigateTo(context, PolicyView());
                },
                icon: const Icon(
                  Icons.policy,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  navigateTo(context, AboutUsView());
                },
                child: const Text(
                  'About Us',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            IconButton(
              onPressed: () {
                navigateTo(context, AboutUsView());
              },
              icon: const Icon(
                Icons.info,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),

        BlocProvider(
          create: (context) => LogoutBloc(sl()),
          child: BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccessState) {
                //   blocLogout.add(LogoutStartProcessEvent());
                navigateTo(context, LoginScreenView());
                showToast(
                    text: 'Logout is done', state: ToastState.SUCCESS); //print(
              /*if(toggle==true)
                toggle=false;
              else
                print('bus not working ${toggle}');
            */  }
              if (state is LogoutServerFailureState) {
                showToast(text: 'Logout is failued', state: ToastState.ERROR);
              }
            },
            builder: (context, state) {
              return state is LogoutLoadingState
                  ? CircularProgressIndicator(
                      color: Colors.blue.shade700,
                    )
                  : Container(
                      decoration: const BoxDecoration(),
                      child: ElevatedButton(
                        onPressed: () {
                          //print('the dat we want it is ${context.read<DriverControlBloc>().toggle}');
                          context
                              .read<LogoutBloc>()
                              .add(LogoutStartProcessEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            // Adjust padding for bigger size
                            backgroundColor:
                                const Color.fromARGB(255, 96, 125, 139)),
                        child: const Text('Log Out',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
