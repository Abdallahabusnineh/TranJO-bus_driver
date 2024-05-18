import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/failure.dart';
import 'package:bus_driver/domain/base_repository/driver_control.dart';
import 'package:dartz/dartz.dart';

class ToggleUseCase extends BaseUseCase<String,NoParameters>
{
  BaseDriverControlRepository baseDriverControlRepository;
  ToggleUseCase(this.baseDriverControlRepository);

  @override
  Future<Either<Failure, String>> call(NoParameters parameters) async {
    return await baseDriverControlRepository.getToggleWorkingStatus();
  }

}