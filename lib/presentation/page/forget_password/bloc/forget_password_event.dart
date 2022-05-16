
import 'package:flutter_password_saver/modules/auth/presentation/auth/register/util/security_question.dart';

abstract class ForgetPasswordEvent {}

class InitializeForgetPasswordEvent extends ForgetPasswordEvent {}

class AnswerQuestionEvent extends ForgetPasswordEvent {
  final SecurityQuestion answer;

  AnswerQuestionEvent({required this.answer});
}

class DeleteAccountEvent extends ForgetPasswordEvent {}

class RenewPasswordEvent extends ForgetPasswordEvent {
  final String password;

  RenewPasswordEvent(this.password);
}
