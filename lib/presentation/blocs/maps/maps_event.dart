part of 'maps_bloc.dart';

@immutable
abstract class MapsEvent {}

class SetNewGoogleMapController extends MapsEvent{}
class GetCurrentLocation extends MapsEvent{}
