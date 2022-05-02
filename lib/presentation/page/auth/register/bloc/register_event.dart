abstract class RegisterEvent {}

class ConfirmNameEvent extends RegisterEvent {
  ConfirmNameEvent({required this.name});

  final String name;
}

class ConfirmPasswordEvent extends RegisterEvent {
    ConfirmPasswordEvent({required this.password});

  final String password;
}
