part of 'drop_bus_bloc.dart';

@immutable
sealed class DropBusState {}

final class DropBusInitial extends DropBusState {}
class LoadingDropBus extends DropBusState{}
class ServerErrorDropBus extends DropBusState{
  final String error;
  ServerErrorDropBus({required this.error});
}
class SuccessDropBus extends DropBusState
{
  final String error ;
  SuccessDropBus({required this.error});
}
