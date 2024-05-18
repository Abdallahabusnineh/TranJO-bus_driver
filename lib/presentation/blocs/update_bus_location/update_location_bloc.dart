import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/update_bus_location_usecase.dart';

part 'update_location_event.dart';
part 'update_location_state.dart';

class UpdateLocationBloc extends Bloc<UpdateLocationEvent, UpdateLocationState> {
  UpdateBusLocationUseCase updateBusLocationUseCase;
  UpdateLocationBloc(this.updateBusLocationUseCase) : super(UpdateLocationInitial()) {
    on<UpdateLocationEvent>(_getUpdateLocation);
  }
  void _getUpdateLocation(event, emit)async {
    emit(LoadingUpdateLocation());
    final result=await updateBusLocationUseCase.call(const NoParameters());
    result.fold(
            (l) => emit(ServerUpdateLocation(error: l.message)),
            (r) => emit(SuccessUpdateLocation(result: r)));
  }
}
