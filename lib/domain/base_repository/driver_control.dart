import 'package:bus_driver/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseDriverControlRepository
{
  Future<Either<Failure,String>>getToggleWorkingStatus();
  Future<Either<Failure,String>>getDropBas();
  Future<Either<Failure,String>>getAddPas();
  Future<Either<Failure,String>>getUpdateBusLocation();
}