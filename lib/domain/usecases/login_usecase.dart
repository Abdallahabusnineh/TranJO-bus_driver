import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/domain/base_repository/base_trasnsjo_repository.dart';
import 'package:bus_driver/domain/entites/login_entites.dart';
import 'package:dartz/dartz.dart';
class LoginUseCase extends BaseUseCase<LoginUserData,LoginParameter>{
  BaseRepository baseRepository;
  LoginUseCase(this.baseRepository);

  @override
  Future<Either<Failure, LoginUserData>> call(LoginParameter parameters) async {
    return await baseRepository.loginApp(parameters);
  }

}