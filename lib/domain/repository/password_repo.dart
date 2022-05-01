import 'package:flutter_password_saver/domain/model/password.dart';

abstract class PasswordRepository {
  Future<List<Password>> getAllPasswords();

  Future<void> savePassword(Password password);
}
