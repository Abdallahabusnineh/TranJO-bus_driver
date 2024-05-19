import 'package:bus_driver/domain/entites/login_entites.dart';

class LoginUserDataModel extends LoginUserData {
  LoginUserDataModel(
      {required super.accessToken,
      required super.password,
      required super.email});

  factory LoginUserDataModel.fromJson(Map<String, dynamic> json) =>
      LoginUserDataModel(
          accessToken: json['access_token'],
          password: json['password'],
          email: json['email']);
}
