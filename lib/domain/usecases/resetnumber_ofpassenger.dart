import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/domain/base_repository/driver_control.dart';
import 'package:dartz/dartz.dart';

class ResetNumberOfPassengerUseCase extends BaseUseCase<int,NoParameters>
{
  BaseDriverControlRepository baseDriverControlRepository;
  ResetNumberOfPassengerUseCase(this.baseDriverControlRepository);

  @override
  Future<Either<Failure, int>> call(NoParameters parameters)async {
   return await baseDriverControlRepository.resetNumberOfPassenger();
  }

}