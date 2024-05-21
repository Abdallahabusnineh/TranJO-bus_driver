import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/base_repository/user_details_base_repository.dart';
import '../../domain/entites/user_details.dart';
import '../datasource/user_details_datasource.dart';

class UserDetailsRepository extends BaseUserDetailsRepository
{
  BaseUserDetailsDataSource baseUserDetailsDataSource;
  UserDetailsRepository(this.baseUserDetailsDataSource);

  @override
  Future<Either<Failure, UserDetails>> getUserDetails() async {
    final result=await baseUserDetailsDataSource.getUserDetails();
    try {
          return Right(result);
        }on ServerExceptions catch(e)
    {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}