import 'package:bus_driver/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
abstract class BaseUseCase<T,Parametres>{
  Future<Either<Failure,T>>call( Parametres parameters);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ForgotPasswordParameter extends Equatable{
  final String email;


  ForgotPasswordParameter(this.email);
  @override
  // TODO: implement props
  List<Object?> get props => [email];

}

class VerificationParameter extends Equatable{
  final String code;
  final String newPassword;

  VerificationParameter(this.code, this.newPassword);
  @override
  // TODO: implement props
  List<Object?> get props => [code,newPassword];
}

class LoginParameter extends Equatable{
  final String email;
  final String password;

  LoginParameter(this.email,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}
