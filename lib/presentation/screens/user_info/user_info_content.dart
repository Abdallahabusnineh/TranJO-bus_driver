import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_const.dart';
import '../../blocs/user_details/user_details_bloc.dart';

class UserInfoContent extends StatelessWidget {
  const UserInfoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsBloc,UserDetailsState>(
      builder: (BuildContext context, UserDetailsState state) {
        return state is SuccessUserDetailsState ? Column(
          children: [
            Container(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Inforamtion ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade200))
                ),
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: userDetailsName,
                      prefixIcon: Icon(Icons.man),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade200))
                ),
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: userDetailsEmail,
                      prefixIcon: Icon(Icons.email),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10,),


          ],
        )  : Center(
          child: CircularProgressIndicator(
          backgroundColor: Colors.blue.shade700,
          color: Colors.grey,
          ),
        );
      },
      listener: (BuildContext context, UserDetailsState state) {  },

    );
  }
}
