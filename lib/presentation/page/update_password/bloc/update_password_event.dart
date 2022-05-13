abstract class UpdatePasswordEvent {}

class InitializeEvent extends UpdatePasswordEvent {}

class ConfirmNewPasswordEvent extends UpdatePasswordEvent {
  final String password;

  ConfirmNewPasswordEvent({required this.password});
}
