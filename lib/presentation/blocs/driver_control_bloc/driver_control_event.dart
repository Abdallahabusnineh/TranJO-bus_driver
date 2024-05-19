part of 'driver_control_bloc.dart';

abstract class AbstractDriverControlEvent {}
class ToggleEvent extends AbstractDriverControlEvent{}
class DropPassengerEvent extends AbstractDriverControlEvent{}
class AddPassengerEvent extends AbstractDriverControlEvent{}
class ResetSeatsNumberEvent extends AbstractDriverControlEvent{}