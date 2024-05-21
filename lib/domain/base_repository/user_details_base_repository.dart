import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entites/user_details.dart';

abstract class BaseUserDetailsRepository
{
  Future<Either<Failure,UserDetails>>getUserDetails();
}