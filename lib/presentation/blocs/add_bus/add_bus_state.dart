part of 'add_bus_bloc.dart';


sealed class AddBusState {}

final class AddBusInitial extends AddBusState {}
class LoadingAddBus extends AddBusState{}
class ServerErrorAddBus extends AddBusState{
  final String error;
  ServerErrorAddBus({required this.error});
}
class SuccessAddBus extends AddBusState
{
  final String result;
  SuccessAddBus({required this.result});
}
