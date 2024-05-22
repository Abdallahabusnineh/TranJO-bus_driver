import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/utils/app_const.dart';
import '../../../core/utils/cash_helper.dart';
import '../../../domain/usecases/logout_usecase.dart';
part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<AbstractLogoutEvent, LogoutState> {
  LogoutBloc(this.logOutUseCase) : super(LogoutInitialState()) {
    on<LogoutStartProcessEvent>(_onLogoutStartProcessEvent);
  }

  LogOutUseCase logOutUseCase;
  Future<FutureOr<void>> _onLogoutStartProcessEvent(
      LogoutStartProcessEvent event, Emitter<LogoutState> emit) async {
    emit(LogoutLoadingState());
    try {
      final result = await logOutUseCase.call(NoParameters());
      result.fold((l) {
        print('logout is done ${l.message}');
        emit(LogoutServerFailureState(l.message));
      }, (r) {
        CashHelper.removeData(key: 'token').then((value) {
          print('success logout youserf');
          token = "";
        }).catchError((e) {
          print('catcherror  ${e.toString()}');
        });
        emit(LogoutSuccessState("logout  Successfully"));
      });
    } catch (e) {
      print('catch bloc ${e.toString()}');
      emit(LogoutServerFailureState(e.toString()));
    }
  }
}
