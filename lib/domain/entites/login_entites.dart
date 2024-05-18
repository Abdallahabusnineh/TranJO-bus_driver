import 'package:equatable/equatable.dart';

class LoginUserData extends Equatable {

  final String accessToken;



  const LoginUserData({
    required this.accessToken,

  });
  @override
  // TODO: implement props
  List<Object?> get props => [accessToken];
}
