import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';

part 'password.g.dart';

@CopyWith()
class Password extends Equatable {
  const Password({
    required this.id,
    this.name = '',
    this.accName = '',
    this.password = '',
    required this.settings,
  });

  final String id;
  final String name;
  final String accName;
  final String password;
  final List<PasswordSettings> settings;

  static List<PasswordSettings> defaultSettings({required String passwordId}) =>
      [
        PasswordSettings(
          passwordId: passwordId,
          name: PasswordSettingsName.alwaysShow,
          value: settingsAlwaysShowDefault,
        ),
        PasswordSettings(
          passwordId: passwordId,
          name: PasswordSettingsName.requireAuthen,
          value: requireAuthenDefault,
        ),
      ];

  @override
  List<Object?> get props => [
        id,
        name,
        accName,
        settings,
      ];
}
