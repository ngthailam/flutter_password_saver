import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';

part 'password.g.dart';

@CopyWith()
class Password {
  Password({
    this.id = '',
    this.name = '',
    this.accName = '',
    this.password = '',
    this.settings = const [],
  });

  final String id;
  final String name;
  final String accName;
  final String password;
  final List<PasswordSettings> settings;
}
