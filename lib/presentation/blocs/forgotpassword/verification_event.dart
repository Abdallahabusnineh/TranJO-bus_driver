part of 'verification_bloc.dart';

@immutable
abstract class AbstractVerificationEvent {}
class VerificationStartProcessEvent extends AbstractVerificationEvent {
  final String newPassword;
  final String code;
  VerificationStartProcessEvent({required this.newPassword,required this.code});
}
class VerificationShowPasswordEvent  extends AbstractVerificationEvent{

}