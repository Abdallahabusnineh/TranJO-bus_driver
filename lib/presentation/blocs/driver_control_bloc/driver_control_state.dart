part of 'driver_control_bloc.dart';

abstract class DriverControlState {}

final class DriverControlInitialState extends DriverControlState {}
class LoadingAddPassenger extends DriverControlState{}
class ServerErrorAddPassenger extends DriverControlState{
  final String error;
  ServerErrorAddPassenger({required this.error});
}
class SuccessAddPassenger extends DriverControlState {
  final int result;
  SuccessAddPassenger({required this.result});
}

class LoadingDropPassenger extends DriverControlState{}
class ServerErrorDropPassenger extends DriverControlState{
  final String error;
  ServerErrorDropPassenger({required this.error});
}
class SuccessDropPassenger extends DriverControlState {
  final int result;

  SuccessDropPassenger(this.result);

}


class LoadingToggleBus extends DriverControlState{}
class ServerErrorToggleBus extends DriverControlState{
  final String error;
  ServerErrorToggleBus({required this.error});
}
class SuccessToggleBus extends DriverControlState {
  final String result;
  SuccessToggleBus({required this.result});
}
class ResetNumberOfPassengerLoadingState extends DriverControlState{}
class ResetNumberOfPassengerSuccessState extends DriverControlState{
  final int r;
  ResetNumberOfPassengerSuccessState({required this.r});
}
class ResetNumberOfPassengerServerFailureState extends DriverControlState {
  final String result;
  ResetNumberOfPassengerServerFailureState({required this.result});
}