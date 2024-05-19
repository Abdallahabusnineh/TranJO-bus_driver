part of 'logout_bloc.dart';


abstract class LogoutState {}

 class LogoutInitialState extends LogoutState {}
 class LogoutLoadingState extends LogoutState {}
 class LogoutSuccessState extends LogoutState {
  final String message;
  LogoutSuccessState(this.message);
 }
 class LogoutServerFailureState extends LogoutState {
   final String message;
   LogoutServerFailureState(this.message);
 }
