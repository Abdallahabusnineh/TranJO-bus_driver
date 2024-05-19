part of 'maps_bloc.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class MapsSetNewGoogleMapControllerState extends MapsState {}
class MapsGetCurrentLocationLoadingState extends MapsState {}
class MapsGetCurrentLocationSuccessState extends MapsState {
}
class MapsGetCurrentLocationFailState extends MapsState {}
