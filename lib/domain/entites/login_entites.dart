import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String accessToken;
  final String ?password;
  final String ?email;

  LoginUserData({required this.accessToken, required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [accessToken,email,password];
}
