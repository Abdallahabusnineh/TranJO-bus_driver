import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {
  final String ?password;
  final String ?email;


  const LoginUserData({
    required this.password,
    required this.email,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [password, email];
}
