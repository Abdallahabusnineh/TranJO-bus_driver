import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/domain/base_repository/forgot_password_repo.dart';
import 'package:dartz/dartz.dart';

class VerificationUseCase extends BaseUseCase<String,VerificationParameter>{
  BaseForgotPasswordRepository baseForgotPasswordRepository;
  VerificationUseCase(this.baseForgotPasswordRepository);
  @override
  Future<Either<Failure, String>> call(VerificationParameter parameters) async {
   return await baseForgotPasswordRepository.verificationCode(parameters);
  }


}