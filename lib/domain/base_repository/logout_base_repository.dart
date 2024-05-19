import 'package:dartz/dartz.dart';


import '../../core/base_usecase/base_usecase.dart';
import '../../core/error/failure.dart';

abstract class LogOutBaseRepository{
  Future<Either<Failure,String>> logOut(NoParameters  parameters);

}