part of 'user_details_bloc.dart';


sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}
class LoadingUserDetailsState extends UserDetailsState{}
class ServerErrorUserState extends UserDetailsState{
  final String error;
  ServerErrorUserState({required this.error});
}
class SuccessUserDetailsState extends UserDetailsState{
  final UserDetails userDetails;
  SuccessUserDetailsState({required this.userDetails});
}
