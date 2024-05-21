import '../../domain/entites/user_details.dart';

class UserDetailsModel extends UserDetails
{
  const UserDetailsModel({required super.email, required super.name});

  factory UserDetailsModel.fromJson(Map<String ,dynamic>json)
  {
    return UserDetailsModel(
        email: json['email'],
        name: json['name']);
  }
}