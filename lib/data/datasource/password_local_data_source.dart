import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/data/entity/password_settings_entity.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordLocalDataSource {
  Future<List<Password>> getAllPaswords();

  Future<void> savePassword(Password password);

  Future<void> deletePassword(String passwordId);

  Future<Password?> getPasswordById(String passwordId);

  Future<List<Password>> searchPassword(String keyword);

  Future<void> updateSettings(PasswordSettings settings);

  Future<void> deleteAll();

  Future<bool> reOrderPasswords(List<Password> passwords);
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
      final passwords = box.values.cast<PasswordEntity>().map((e) {
        final settings = e.settings
                ?.castHiveList<PasswordSettingsEntity>()
                .map((e) => e.toModel())
                .toList() ??
            [];
        return e.toModel(settings);
      }).toList();
      return passwords;
    } catch (e) {
      return Future.error(e);
    } finally {
      await settingsBox.close();
      await box.close();
    }
  }

  @override
  Future<void> savePassword(Password password) async {
    final settingsBox = await _getSettingsBox();
    final box = await _getPasswordBox();
    try {
      final settingEntities = password.settings
          .map((e) => PasswordSettingsEntity.fromPasswordSettings(e))
          .toList();
      settingsBox.putAll(
        {for (var e in settingEntities) e.key: e},
      );

      final passEntity = PasswordEntity.fromPassword(
        password: password,
        settings: HiveList(settingsBox, objects: settingEntities),
      );

      await box.put(passEntity.key, passEntity);
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
  Future<Password?> getPasswordById(String passwordId) async {
    final settingsBox = await _getSettingsBox();
    final box = await _getPasswordBox();
    try {
      final PasswordEntity result = box.get(passwordId)!;
      final settings = result.settings
              ?.castHiveList<PasswordSettingsEntity>()
              .map((e) => e.toModel())
              .toList() ??
          [];
      return result.toModel(settings);
    } catch (e) {
      return null;
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
              (element) =>
                  element.name.toLowerCase().contains(keyword.toLowerCase()),
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

  @override
  Future<void> deleteAll() async {
    final settingsBox = await _getSettingsBox();
    final box = await _getPasswordBox();
    await settingsBox.clear();
    await box.clear();
    return;
  }

  @override
  Future<bool> reOrderPasswords(List<Password> passwords) async {
    try {
      final settingsBox = await _getSettingsBox();
      final box = await _getPasswordBox();
      for (var password in passwords) {
        final settingEntities = password.settings
            .map((e) => PasswordSettingsEntity.fromPasswordSettings(e))
            .toList();
        settingsBox.putAll(
          {for (var e in settingEntities) e.key: e},
        );

        final passEntity = PasswordEntity.fromPassword(
          password: password,
          settings: HiveList(settingsBox, objects: settingEntities),
        );

        await box.put(passEntity.key, passEntity);
      }
      return true;
    } catch (e) {
      return false;
    } finally {}
  }
}
