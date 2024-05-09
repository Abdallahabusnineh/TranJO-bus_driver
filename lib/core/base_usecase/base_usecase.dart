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

class LoginParameter extends Equatable{
  final String email;
  final String password;

  LoginParameter(this.email,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}
