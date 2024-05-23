part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitialState extends ForgotPasswordState {}
class ForgotPasswordLoadingState extends ForgotPasswordState {}
class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String success;
  ForgotPasswordSuccessState(this.success);

}
class ForgotPasswordServerFailureState extends ForgotPasswordState {
  final String error;
  ForgotPasswordServerFailureState(this.error);
}
class ForgotPasswordErrorState extends ForgotPasswordState {
  final String error;
  ForgotPasswordErrorState(this.error);
}
