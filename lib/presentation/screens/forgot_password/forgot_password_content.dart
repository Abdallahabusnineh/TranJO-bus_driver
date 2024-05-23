import 'package:animate_do/animate_do.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordContent extends StatelessWidget {
  const ForgotPasswordContent({super.key});
static String ?email;
  @override
  Widget build(BuildContext context) {

    ForgotPasswordBloc  bloc=BlocProvider.of<ForgotPasswordBloc>(context);
    ForgotPasswordBloc  blocListener=context.watch<ForgotPasswordBloc>();
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
                        "Forgot Password",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: Text(
                      'Enter your email to restore your password',
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
                          height: 270,
                          child: Image(
                            image: AssetImage('assets/images/Forgot_password.png'),
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
                            children: <Widget>[

                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInUp(
                                  duration: Duration(milliseconds: 1000),
                                  child: TextFormField(
                                    controller: bloc.emailNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        hintText: 'email',
                                        prefixIcon: Icon(Icons.email),
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'Please enter your email';
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
                        blocListener.state is ForgotPasswordLoadingState?Center(child: CircularProgressIndicator(color: Colors.blue.shade700,)):
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
                                     if(bloc.formKey.currentState!.validate()){
                                  bloc.add(SendCodeProcessEvent(email: bloc.emailNameController.text));
                                email=bloc.emailNameController.text;
                                     }},
                                child: Text(
                                  'Send',
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
