import 'package:bus_driver/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseDriverControlRepository
{
  Future<Either<Failure,String>>getToggleWorkingStatus();
  Future<Either<Failure,int>>getDropBas();
  Future<Either<Failure,int>>getAddPas();
  Future<Either<Failure,String>>getUpdateBusLocation();
}