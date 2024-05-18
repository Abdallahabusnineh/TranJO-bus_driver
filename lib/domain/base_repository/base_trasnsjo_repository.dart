import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/domain/entites/login_entites.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRepository{
  Future<Either<Failure,LoginUserData>> loginApp(LoginParameter  parameters);

}