import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/domain/usecases/forgot_password/verification_usecase.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/verification_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'verification_event.dart';


class VerificationBloc extends Bloc<AbstractVerificationEvent,VerificationState> {
  VerificationBloc(this.verificationUseCase) : super(VerificationInitialState()) {
    on<VerificationStartProcessEvent>(_onVerificationStartProcessEvent);
    on<VerificationShowPasswordEvent>(_onVerificationShowPasswordEvent);
  }
  TextEditingController codeNameController = TextEditingController();
  TextEditingController newPasswordNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = true;
  VerificationUseCase verificationUseCase;
  Future<FutureOr<void>> _onVerificationStartProcessEvent(VerificationStartProcessEvent event, Emitter<VerificationState> emit) async {
    emit(VerificationLoadingState());
    try {
      final result =
      await verificationUseCase.call(VerificationParameter(event.code, event.newPassword));
      result.fold((l) {
        print('send code is done ${l.message}');
        emit(VerificationServerFailureState(l.message));
      }, (r) {
        emit(VerificationSuccessState("Login Successfully"));
      });
    } catch (e) {
      print(e.toString());
      emit(VerificationErrorState(e.toString()));
    }
  }

  FutureOr<void> _onVerificationShowPasswordEvent(VerificationShowPasswordEvent event, Emitter<VerificationState> emit) {
    showPassword = !showPassword;
    emit(VerificationIconDataChanged());
  }
}
