import 'package:dartz/dartz.dart';

import '../../core/base_usecase/base_usecase.dart';
import '../../core/error/failure.dart';
import '../base_repository/user_details_base_repository.dart';
import '../entites/user_details.dart';

class UserDetailsUseCase extends BaseUseCase<UserDetails,NoParameters>
{
  BaseUserDetailsRepository baseUserDetailsRepository;
  UserDetailsUseCase(this.baseUserDetailsRepository);

  @override
  Future<Either<Failure, UserDetails>> call(NoParameters parameters) async{
    return await baseUserDetailsRepository.getUserDetails();
  }

}