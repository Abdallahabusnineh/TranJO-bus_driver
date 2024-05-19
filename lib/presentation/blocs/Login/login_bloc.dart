import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/utils/app_const.dart';
import 'package:bus_driver/core/utils/cash_helper.dart';
import 'package:bus_driver/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<AbstractLoginEvent, LoginState> {
  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginStartProcessEvent>(_onLoginStartProcessEvent);
    on<ShowPasswordEvent>(_onShowPasswordEvent);
  }

  bool showPassword = true;

  TextEditingController emailNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;



  FutureOr<void> _onShowPasswordEvent(
      ShowPasswordEvent event, Emitter<LoginState> emit) {
    showPassword = !showPassword;
    emit(IconDataChanged());
  }

  Future<FutureOr<void>> _onLoginStartProcessEvent(LoginStartProcessEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try{
      final result =
          await loginUseCase.call(LoginParameter(event.email, event.password));
      result.fold((l) {
        print('carlossss ${l.message}');
        emit(LoginServerFailure("login left failure ${l.message}"));
      }, (r) {
        CashHelper.saveData(key: "token", value: r.accessToken).
        then((value) => print('save token  $token'));
        token=r.accessToken;
        emit(LoginSuccessState("Login Successfully"));
      });
    }
    catch(e){
      print('error catch ${e.toString()}');
      emit(LoginErrorState('login failure ${e.toString()}'));
    }
  }
}
