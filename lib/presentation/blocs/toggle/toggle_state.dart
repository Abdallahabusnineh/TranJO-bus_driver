part of 'toggle_bloc.dart';


sealed class ToggleState {}

final class ToggleInitial extends ToggleState {}
class LoadingToggleState extends ToggleState{}
class ServerErrorState extends ToggleState{
  String error;
  ServerErrorState({required this.error});
}
class SuccessToggleState extends ToggleState{
  final String result;
  SuccessToggleState({required this.result});
}
