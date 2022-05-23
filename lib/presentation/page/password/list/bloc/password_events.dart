import 'package:flutter_password_saver/domain/model/password_settings.dart';

abstract class PasswordEvent {}

class InitializeEvent extends PasswordEvent {}

class GetPasswordEvent extends PasswordEvent {}

class DeletePasswordEvent extends PasswordEvent {
  DeletePasswordEvent({required this.id});

  final String id;
}

class SearchPasswordEvent extends PasswordEvent {
  SearchPasswordEvent({this.keyword = ''});

  final String keyword;
}

class UpdateSettingsEvent extends PasswordEvent {
  final String passwordId;
  final PasswordSettingsName name;
  final dynamic value;

  UpdateSettingsEvent({
    required this.passwordId,
    required this.name,
    this.value,
  });
}

class RefreshDataEvent extends PasswordEvent {}

class HasShownOnboardEvent extends PasswordEvent {}