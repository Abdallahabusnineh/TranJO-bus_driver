import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:dartz/dartz.dart';


abstract class BaseForgotPasswordRepository{
  Future<Either<Failure,String>> sendCode(ForgotPasswordParameter  parameters);
  Future<Either<Failure,String>> verificationCode(VerificationParameter  parameters);

}