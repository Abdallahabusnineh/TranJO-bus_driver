import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/domain/base_repository/forgot_password_repo.dart';
import 'package:dartz/dartz.dart';

class SendCodeUseCase extends BaseUseCase<String,ForgotPasswordParameter>{
  BaseForgotPasswordRepository baseForgotPasswordRepository;
  SendCodeUseCase(this.baseForgotPasswordRepository);
  @override
  Future<Either<Failure, String>> call(ForgotPasswordParameter parameters) async {
   return await baseForgotPasswordRepository.sendCode(parameters);
  }


}