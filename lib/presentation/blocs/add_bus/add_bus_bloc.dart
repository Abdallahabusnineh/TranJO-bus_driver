import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/domain/usecases/add_pas_usecase.dart';


part 'add_bus_event.dart';
part 'add_bus_state.dart';

class AddBusBloc extends Bloc<AddBusEvent, AddBusState> {
  AddPasUseCase addBusUesCase ;
  AddBusBloc(this.addBusUesCase) : super(AddBusInitial()) {
    on<AddBusEvent>((event, emit)async {
      emit(LoadingAddBus());
     final result=await addBusUesCase.call(const NoParameters());
     result.fold(
             (l) => emit(ServerErrorAddBus(error: l.message)),
             (r) => emit(SuccessAddBus(result: r)));
    });
  }
}
