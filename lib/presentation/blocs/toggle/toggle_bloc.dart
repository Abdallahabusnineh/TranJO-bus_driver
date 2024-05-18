import 'package:bloc/bloc.dart';
import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import '../../../domain/usecases/toggle_usecase.dart';


part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {


  //=============UseCase==============
  ToggleUseCase toggleUseCase;
  ToggleBloc(this.toggleUseCase) : super(ToggleInitial()) {
    on<ToggleEvent>(_getToggle);
  }

  void _getToggle(ToggleEvent event,Emitter<ToggleState>state)
  async
  {
    emit(LoadingToggleState());
    final result=await toggleUseCase.call(const NoParameters());
    result.fold(
            (l) => emit(ServerErrorState(error: l.message)),
            (r) => emit(SuccessToggleState(result: r)));

  }
}
