
import 'package:bus_driver/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  const LoginUserDataModel(
      {required super.accessToken});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      const LoginUserDataModel(accessToken: "access_token");

}
