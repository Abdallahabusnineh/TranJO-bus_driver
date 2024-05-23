part of 'forgot_password_bloc.dart';

@immutable
abstract class AbstractForgotPasswordEvent {}
class SendCodeProcessEvent extends AbstractForgotPasswordEvent {
  final String email;
  SendCodeProcessEvent({required this.email});
}