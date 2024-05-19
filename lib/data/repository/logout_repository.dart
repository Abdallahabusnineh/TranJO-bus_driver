import 'package:dartz/dartz.dart';

import '../../core/base_usecase/base_usecase.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/base_repository/logout_base_repository.dart';
import '../datasource/logout_remotedatasource.dart';

class LogOutRepository extends LogOutBaseRepository{
  final LogOutBaseDataSource logOutBaseDataSource;
  LogOutRepository(this.logOutBaseDataSource);
  @override
  Future<Either<Failure, String>> logOut(NoParameters parameters) async {
    final result =
    await logOutBaseDataSource.logout(parameters);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(ServerFailure(
          'logout repo failure${failure.errorMessageModel.message}'));
    }
  }
}