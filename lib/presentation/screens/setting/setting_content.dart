import 'package:bus_driver/core/common_widgets/navigations_types.dart';
import 'package:bus_driver/presentation/screens/login/login_view.dart';
import 'package:flutter/material.dart';

class SettingContent extends StatelessWidget {
  const SettingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  //navigateTo(context, ProfileSceeenView());
                },
                child: const Text(
                  'User Info',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  //navigateTo(context, ProfileSceeenView());
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
        Row(
          children: [
            TextButton(
                onPressed: () {
                  //navigateTo(context, UserChangePasswordView());
                },
                child: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  // navigateTo(context, UserChangePasswordView());
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
              ),
            ),
          ],
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
        Row(
          children: [
            TextButton(
                onPressed: () {
                  //navigateTo(context, FeedbackView());
                },
                child: const Text(
                  'Feedback',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  //navigateTo(context, FeedbackView());
                },
                icon: const Icon(
                  Icons.feed,
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
                  //navigateTo(context, PolicyView());
                },
                child: const Text(
                  'Policy',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  //navigateTo(context, PolicyView());
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
                  //navigateTo(context, AboutUsView());
                },
                child: const Text(
                  'About Us',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )),
            const Spacer(),
            Container(
              child: IconButton(
                onPressed: () {
                  //navigateTo(context, AboutUsView());
                },
                icon: const Icon(
                  Icons.info,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          child: ElevatedButton(
            onPressed: () {
              navigateTo(context, LoginScreenView());
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                // Adjust padding for bigger size
                backgroundColor:  Color.fromARGB(255,0,0,0)),
            child: const Text('Log Out',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
          decoration: const BoxDecoration(),
        )
      ]),
    );
  }
}
