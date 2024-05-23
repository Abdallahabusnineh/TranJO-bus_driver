
abstract class VerificationState {}

class VerificationInitialState extends VerificationState {}
class VerificationLoadingState extends VerificationState {}
class VerificationSuccessState extends VerificationState {
  final String success;
  VerificationSuccessState(this.success);

}
class VerificationServerFailureState extends VerificationState {
  final String error;
  VerificationServerFailureState(this.error);
}
class VerificationErrorState extends VerificationState {
  final String error;
  VerificationErrorState(this.error);
}
class VerificationIconDataChanged extends VerificationState{}