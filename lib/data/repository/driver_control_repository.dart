import 'package:bus_driver/core/error/exceptions.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/data/datasource/driver_control_datasource.dart';
import 'package:bus_driver/domain/base_repository/driver_control.dart';
import 'package:dartz/dartz.dart';

class DriverControlRepository extends BaseDriverControlRepository
{
  BaseDriverControlDataSource baseDriverControlDataSource;
  DriverControlRepository(this.baseDriverControlDataSource);
  @override
  Future<Either<Failure, String>> getToggleWorkingStatus()async {
    final result=await baseDriverControlDataSource.getToggleWorkingStatus();
    try
        {
         return Right(result);
        }on ServerExceptions catch(e)
    {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getDropBas()async {
    final result=await baseDriverControlDataSource.getDropPas();
    try
    {
      return Right(result);
    }on ServerExceptions catch(e)
    {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getAddPas()async {
    final result=await baseDriverControlDataSource.getAddPas();
    try
        {
          return Right(result);
        }on ServerExceptions catch(e)
    {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getUpdateBusLocation() async{
    final result=await baseDriverControlDataSource.getUpdateBusLocation();
    try
        {
          return Right(result);
        }on ServerExceptions catch(e)
    {
      return Left(ServerFailure(e.errorMessageModel.message));
    }

  }

}