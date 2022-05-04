import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/data/entity/password_settings_entity.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordLocalDataSource {
  Future<List<Password>> getAllPaswords();

  Future<void> savePassword(PasswordEntity password);

  Future<void> deletePassword(String passwordId);

  Future<Password> getPasswordById(String passwordId);

  Future<List<Password>> searchPassword(String keyword);

  Future<void> updateSettings(PasswordSettings settings);
}

@Injectable(as: PasswordLocalDataSource)
class PasswordLocalDataSourceImpl extends PasswordLocalDataSource {
  PasswordLocalDataSourceImpl(this._secureStorage);

  final SecureStorage _secureStorage;

  Future<Box<PasswordEntity>> _getPasswordBox() async {
    final encryptionKey = await _secureStorage.getDbEncryptionKey();
    return Hive.openBox(
      passwordEntityBox,
      encryptionCipher: HiveAesCipher(encryptionKey!),
    );
  }

  Future<Box<PasswordSettingsEntity>> _getSettingsBox() {
    return Hive.openBox(passwordSettingsBox);
  }

  @override
  Future<List<Password>> getAllPaswords() async {
    final settingsBox = await _getSettingsBox();
    Box box = await _getPasswordBox();

    try {
      if (!box.isOpen) {
        box = await _getPasswordBox();
      }
      final passwords =
          box.values.cast<PasswordEntity>().map((e) => e.toModel()).toList();
      return passwords;
    } catch (e) {
      return Future.error(e);
    } finally {
      await settingsBox.close();
      await box.close();
    }
  }

  @override
  Future<void> savePassword(PasswordEntity password) async {
    final settingsBox = await _getSettingsBox();
    final box = await _getPasswordBox();
    try {
      await box.put(password.key, password);
      return;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await settingsBox.close();
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
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<Password> getPasswordById(String passwordId) async {
    final settingsBox = await _getSettingsBox();

    final box = await _getPasswordBox();
    try {
      final result = box.get(passwordId);
      return result!.toModel();
    } catch (e) {
      return Future.error(e);
    } finally {
      await settingsBox.close();
      await box.close();
    }
  }

  @override
  Future<List<Password>> searchPassword(String keyword) {
    return getAllPaswords().then((value) {
      if (keyword.isEmpty) {
        return value;
      } else {
        return value
            .where(
              (element) => element.name.contains(keyword),
              //  || element.accName.contains(keyword)
            )
            .toList();
      }
    });
  }

  @override
  Future<void> updateSettings(PasswordSettings settings) async {
    final settingsBox =
        await Hive.openBox<PasswordSettingsEntity>(passwordSettingsBox);
    final settingsEntity =
        PasswordSettingsEntity.fromPasswordSettings(settings);
    try {
      if (settings.passwordId.isEmpty) {
        return Future.error(
          Exception('Password ${settings.passwordId} does not exist'),
        );
      }

      await settingsBox.put(settingsEntity.key, settingsEntity);
    } catch (e) {
      return Future.error(e);
    } finally {
      await settingsBox.close();
    }
  }
}
