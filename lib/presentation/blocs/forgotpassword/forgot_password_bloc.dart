import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/domain/usecases/forgot_password/forgot_password_usecase.dart';
import 'package:flutter/material.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<AbstractForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this.sendCodeUseCase)
      : super(ForgotPasswordInitialState()) {
    on<SendCodeProcessEvent>(_onSendCodeProcessEvent);
  }
  TextEditingController emailNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SendCodeUseCase sendCodeUseCase;

  Future<FutureOr<void>> _onSendCodeProcessEvent(
      SendCodeProcessEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoadingState());
    try {
      final result =
          await sendCodeUseCase.call(ForgotPasswordParameter(event.email));
      result.fold((l) {
        print('send code is done ${l.message}');
        emit(ForgotPasswordServerFailureState(l.message));
      }, (r) {
        emit(ForgotPasswordSuccessState("Login Successfully"));
      });
    } catch (e) {
      print(e.toString());
      emit(ForgotPasswordErrorState(e.toString()));
    }
  }
}
