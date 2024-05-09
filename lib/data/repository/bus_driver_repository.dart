import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/exceptions.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/data/datasource/remote_datasource.dart';
import 'package:bus_driver/domain/base_repository/base_trasnsjo_repository.dart';
import 'package:dartz/dartz.dart';

class Repository extends BaseRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  Repository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, String>> loginApp(LoginParameter parameters) async {
    final result=await baseRemoteDataSource.loginApp(parameters);
 try{
   return Right(result );
 }on ServerExceptions catch(failure){
   return Left(ServerFailure(failure.errorMessageModel.message));
 }
  }

}
