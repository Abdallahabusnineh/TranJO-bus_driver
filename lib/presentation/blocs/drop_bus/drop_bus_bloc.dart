import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/domain/usecases/drop_pas_usecase.dart';
import 'package:meta/meta.dart';

part 'drop_bus_event.dart';
part 'drop_bus_state.dart';

class DropBusBloc extends Bloc<DropBusEvent, DropBusState> {
  DropPasUseCase dropBusUseCase;
  DropBusBloc(this.dropBusUseCase) : super(DropBusInitial()) {
    on<DropBusEvent>(_getDropBus);
  }
  void _getDropBus (event, emit)async {
    emit(LoadingDropBus());
    final result=await dropBusUseCase.call(NoParameters());
    result.fold(
            (l) => emit(ServerErrorDropBus(error: l.message)),
            (r) => emit(SuccessDropBus(error: r)));
  }
}
