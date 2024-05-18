part of 'update_location_bloc.dart';

@immutable
sealed class UpdateLocationState {}

final class UpdateLocationInitial extends UpdateLocationState {}
class LoadingUpdateLocation extends UpdateLocationState{}
class ServerUpdateLocation extends UpdateLocationState{
  final String error;
  ServerUpdateLocation({required this.error});
}
class SuccessUpdateLocation extends UpdateLocationState{
  final String result;
  SuccessUpdateLocation({required this.result});
}