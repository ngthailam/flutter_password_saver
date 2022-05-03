import 'package:copy_with_extension/copy_with_extension.dart';

part 'password_settings.g.dart';

enum PasswordSettingsName {
  alwaysShow,
}

@CopyWith()
class PasswordSettings {
  PasswordSettings({
    this.passwordId = '',
    required this.name,
    this.value,
  });

  final String passwordId;
  final PasswordSettingsName name;
  final dynamic value;
}
