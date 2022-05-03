import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordLocalDataSource {
  Future<List<PasswordEntity>> getAllPaswords();

  Future<void> savePassword(PasswordEntity password);

  Future<void> deletePassword(String passwordId);

  Future<PasswordEntity> getPasswordById(String passwordId);

  Future<List<PasswordEntity>> searchPassword(String keyword);
}

@Injectable(as: PasswordLocalDataSource)
class PasswordLocalDataSourceImpl extends PasswordLocalDataSource {
  PasswordLocalDataSourceImpl(this._secureStorage);

  final SecureStorage _secureStorage;

  @override
  Future<List<PasswordEntity>> getAllPaswords() async {
    final box = await _getPasswordBox();
    try {
      final passwords =
          box.values.cast().map((e) => e as PasswordEntity).toList();
      return passwords;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<void> savePassword(PasswordEntity password) async {
    final box = await _getPasswordBox();
    try {
      await box.put(password.key, password);
      return;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<void> deletePassword(String passwordId) async {
    final box = await _getPasswordBox();
    try {
      await box.delete(passwordId);
      return;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<PasswordEntity> getPasswordById(String passwordId) async {
    final box = await _getPasswordBox();
    try {
      final result = box.get(passwordId);
      return result!;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<List<PasswordEntity>> searchPassword(String keyword) {
    return getAllPaswords().then((value) {
      if (keyword.isEmpty) {
        return value;
      } else {
        return value
            .where((element) =>
                element.accName.contains(keyword) ||
                element.name.contains(keyword))
            .toList();
      }
    });
  }

  Future<Box<PasswordEntity>> _getPasswordBox() async {
    final encryptionKey = await _secureStorage.getDbEncryptionKey();
    return Hive.openBox(
      passwordEntityBox,
      encryptionCipher: HiveAesCipher(encryptionKey!),
    );
  }
}
