import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';

abstract class PasswordRepository {
  Future<List<Password>> getAllPasswords();

  Future<void> savePassword(Password password);

  Future<void> deletePassword(String passwordId);

  Future<Password?> getPasswordById(String passwordId);

  Future<List<Password>> searchPassword(String keyword);

  Future<void> updateSettings(PasswordSettings settings);

  Future<bool> reOrderPasswords(List<Password> passwords);
}
