part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
 // final LoginSuccess loginSuccess;
final String r;
  LoginSuccessState(this.r);
}
class LoginServerFailure extends LoginState{
  final String errorMessage;

  LoginServerFailure(this.errorMessage);
}
class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState(this.error);

}
class IconDataChanged extends LoginState{
}