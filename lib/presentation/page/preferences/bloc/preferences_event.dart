import 'package:flutter_password_saver/domain/model/account_preference.dart';

abstract class PreferenceEvent {}

class PreferenceInitEvent extends PreferenceEvent {}

class SavePreferenceEvent extends PreferenceEvent {
  SavePreferenceEvent({required this.name, required this.value});

  final PreferenceName name;
  final dynamic value;
}

class DeleteAccountEvent extends PreferenceEvent {}
