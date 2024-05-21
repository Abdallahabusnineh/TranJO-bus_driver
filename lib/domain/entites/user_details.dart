import 'package:equatable/equatable.dart';

class UserDetails  extends Equatable
{
  final String email;
  final String name;
  const UserDetails({required this.email,required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name,email];


}