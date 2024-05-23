import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/exceptions.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/data/datasource/forgot_password_datasource.dart';
import 'package:bus_driver/domain/base_repository/forgot_password_repo.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordRepository extends BaseForgotPasswordRepository{
  final BaseForgotPasswordDataSource baseForgotPasswordDataSource;

  ForgotPasswordRepository(this.baseForgotPasswordDataSource);
  @override
  Future<Either<Failure, String>> sendCode(ForgotPasswordParameter parameters) async {
    final result=await baseForgotPasswordDataSource.sendCode(parameters);
    try{
      return Right(result.toString());
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> verificationCode(VerificationParameter parameters) async {
    final result=await baseForgotPasswordDataSource.verificationCode(parameters);
    try{
      return Right(result.toString());
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}