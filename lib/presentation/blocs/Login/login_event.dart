part of 'login_bloc.dart';
@immutable
abstract class AbstractLoginEvent {}
class LoginStartProcessEvent extends AbstractLoginEvent{
  final String email;
  final String password;
  LoginStartProcessEvent({required this.email, required this.password});

}
class ShowPasswordEvent  extends AbstractLoginEvent{

}