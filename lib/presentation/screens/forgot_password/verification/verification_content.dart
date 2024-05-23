import 'package:animate_do/animate_do.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/verification_bloc.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationContent extends StatelessWidget {
  const VerificationContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VerificationBloc  bloc=BlocProvider.of<VerificationBloc>(context);
    VerificationBloc  blocListener=context.watch<VerificationBloc>();
    return Form(
      key: bloc.formKey,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.indigoAccent,
              Colors.deepPurple.shade700,
              Colors.blueAccent,

            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Text(
                        "verification",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: Text(
                      'Please verify the code sent to your email',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image(
                            height: 200,
                            width: 200,
                            image: AssetImage('assets/images/verification.jpg'),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                const BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, 0.3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInUp(
                                  duration: Duration(milliseconds: 1000),
                                  child: TextFormField(
                                    controller: bloc.codeNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        hintText: 'Code',
                                        prefixIcon:
                                            Icon(Icons.verified_user_rounded),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'Please enter code';
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInUp(
                                  duration: Duration(milliseconds: 1000),
                                  child: TextFormField(
                                    obscureText: blocListener.showPassword,
                                    controller:bloc.newPasswordNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(

                                        hintText: 'Enter New Password',

                                        prefixIcon: Icon(Icons.security),
                                        suffixIcon:IconButton(onPressed: (){
                                          bloc.add(VerificationShowPasswordEvent());
                                        },icon: blocListener.showPassword?Icon(Icons.visibility_off_rounded):Icon(Icons.remove_red_eye_outlined),),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'Please enter new password';
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        blocListener.state is VerificationLoadingState?Center(child: CircularProgressIndicator(color: Colors.blue.shade700,)):

                        Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade900),
                            child: Center(
                                child: FadeInUp(
                              duration: Duration(milliseconds: 1000),
                              child: TextButton(
                                onPressed: () {
                                     if(bloc.formKey.currentState!.validate())
                                       bloc.add(VerificationStartProcessEvent(code: bloc.codeNameController.text,newPassword: bloc.newPasswordNameController.text));

                                },
                                child: Text(
                                  'verification',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                            ))),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
