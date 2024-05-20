import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../domain/usecases/add_pas_usecase.dart';
import '../../../domain/usecases/drop_pas_usecase.dart';
import '../../../domain/usecases/toggle_usecase.dart';

part 'driver_control_event.dart';
part 'driver_control_state.dart';

class DriverControlBloc extends Bloc<AbstractDriverControlEvent, DriverControlState> {
  DriverControlBloc(this.addBusUesCase,this.dropPasUseCase,this.toggleUseCase) : super(DriverControlInitialState()) {
    on<ToggleEvent>(_onToggleEvent);
    on<DropPassengerEvent>(_onDropPassengerEvent);
    on<AddPassengerEvent>(_onAddPassengerEvent);
    on<ResetSeatsNumberEvent>(_onResetSeatsNumberEvent);
  }

  AddPasUseCase addBusUesCase;
  ToggleUseCase toggleUseCase;
 bool toggle=false;
  DropPasUseCase dropPasUseCase;

  Future<FutureOr<void>> _onToggleEvent(ToggleEvent event,
      Emitter<DriverControlState> emit) async {
    try{
      emit(LoadingToggleBus());
      toggle = !toggle;
      final result = await toggleUseCase.call(const NoParameters());
      result.fold((l) => emit(ServerErrorToggleBus(error: l.message)),
          (r) {
        print('success toggle');
            emit(SuccessToggleBus(result: r));
          });
    }catch(e){
      print('error catch ${e.toString()}');
      emit(ServerErrorToggleBus(error: "error catch ${e.toString()}"));
    }
  }

  Future<FutureOr<void>> _onDropPassengerEvent(DropPassengerEvent event,
      Emitter<DriverControlState> emit) async {
   try {
      emit(LoadingDropPassenger());
      final result = await dropPasUseCase.call(NoParameters());
      result.fold((l) {
        print("drop pass {$l.message}");
        emit(ServerErrorDropPassenger(error: l.message));
      },
          (r) {
            print('drop success');

            emit(SuccessDropPassenger(r));
          });
    }
    catch(e){
      print('error catch ${e.toString()}');
      emit(ServerErrorDropPassenger(error: "error catch ${e.toString()}"));

    }
  }

  Future<FutureOr<void>> _onAddPassengerEvent(AddPassengerEvent event,
      Emitter<DriverControlState> emit) async {
    try{
      emit(LoadingAddPassenger());
      final result = await addBusUesCase.call(const NoParameters());
      result.fold((l) {
        print("add pass {$l.message}");

        emit(ServerErrorAddPassenger(error: l.message));
      },
          (r) {
            print('add success');

            emit(SuccessAddPassenger(result: r));
          });
    }catch(e){
      print('error catch ${e.toString()}');
      emit(ServerErrorAddPassenger(error: "error catch ${e.toString()}"));

    }
  }




  FutureOr<void> _onResetSeatsNumberEvent(ResetSeatsNumberEvent event, Emitter<DriverControlState> emit) {
  }
}