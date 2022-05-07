abstract class PreferenceEvent {}

class PreferenceInitEvent extends PreferenceEvent {}

class PreferenceSaveRequireLoginEvent extends PreferenceEvent {
  PreferenceSaveRequireLoginEvent(this.requirePassOnLogin);

  final bool requirePassOnLogin;
}

class PreferenceSaveAlwaysShowPasswordEvent extends PreferenceEvent {
  PreferenceSaveAlwaysShowPasswordEvent(this.alwaysShowPasswords);

  final bool alwaysShowPasswords;
}

class DeleteAccountEvent extends PreferenceEvent {}