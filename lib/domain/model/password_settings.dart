import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'password_settings.g.dart';

const settingsAlwaysShowDefault = false;
const requireAuthenDefault = false;

enum PasswordSettingsName {
  alwaysShow,
  requireAuthen,
}

@CopyWith()
class PasswordSettings extends Equatable {
  const PasswordSettings({
    this.passwordId = '',
    required this.name,
    this.value,
  });

  final String passwordId;
  final PasswordSettingsName name;
  final dynamic value;

  @override
  List<Object?> get props => [
        passwordId,
        name,
        value,
      ];
}
