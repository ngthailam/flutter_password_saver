
import 'package:flutter_password_saver/modules/auth/presentation/auth/register/util/security_question.dart';

abstract class RegisterEvent {}

class ConfirmNameEvent extends RegisterEvent {
  ConfirmNameEvent({required this.name});

  final String name;
}

class ConfirmPasswordEvent extends RegisterEvent {
  ConfirmPasswordEvent({required this.password});

  final String password;
}

class ConfirmSecurityQuestionEvent extends RegisterEvent {
  ConfirmSecurityQuestionEvent({this.question});

  final SecurityQuestion? question;
}
