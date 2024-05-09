
import 'package:bus_driver/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  const LoginUserDataModel(
      {required super.password, required super.email});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      LoginUserDataModel(
          password: json['password'],
          email: json['email']);
}
