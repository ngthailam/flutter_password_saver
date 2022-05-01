abstract class PasswordSaveEvent {}

class PasswordSaveConfirmEvent extends PasswordSaveEvent {}

class PasswordSavePrefetchEvent extends PasswordSaveEvent {
  PasswordSavePrefetchEvent({this.passwordId});

  final String? passwordId;
}
