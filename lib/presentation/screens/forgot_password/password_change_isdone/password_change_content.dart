import 'package:animate_do/animate_do.dart';
import 'package:bus_driver/core/common_widgets/navigations_types.dart';
import 'package:bus_driver/presentation/screens/login/login_view.dart';
import 'package:flutter/material.dart';

class PasswordChangeContent extends StatelessWidget {
  const PasswordChangeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Container(
  height: 400,
  //height: 200,
  decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/images/password_isChanged2.png'))
  ),
),
        Text('Password Changed',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 35),),
       SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0,0,0,0),
          child: Text('Your password has been changed successfully!',style: TextStyle(fontFamily: 'Montserrat',fontSize: 20),),
        ),
        SizedBox(height: 50,),

        Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue.shade700),
            child: Center(
                child: FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: TextButton(
                    onPressed: () {
                        navigateTo(context, LoginScreenView());
                    },
                    child: Text(
                      'Go to login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))),




      ],
    );
  }
}
