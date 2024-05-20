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

class LoadingResetSeats extends DriverControlState{}
class ServerErrorResetSeats extends DriverControlState{
  final String error;
  ServerErrorResetSeats({required this.error});
}
class SuccessResetSeats extends DriverControlState {
  final String result;
  SuccessResetSeats({required this.result});
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