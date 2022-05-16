import 'package:flutter_password_saver/data/datasource/auth_login_lock_data_source.dart';
import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/modules/auth/data/entity/account_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveAccount(AccountEntity user);

  Future<AccountEntity?> getCurrentUser();

  Future<bool> login(User user);

  Future<void> deleteAll();

  Future<void> updatePassword(String password);
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl(
    this._secureStorage,
    this._authLoginLockDataSource,
  );

  final SecureStorage _secureStorage;
  final AuthLoginLockDataSource _authLoginLockDataSource;

  @override
  Future<AccountEntity?> getCurrentUser() async {
    final box = await _getUserBox();
    try {
      final user = await box.values.cast().first as AccountEntity;
      return user;
    } catch (e) {
      return null;
    } finally {
      await box.close();
    }
  }

  @override
  Future<bool> saveAccount(AccountEntity user) async {
    final box = await _getUserBox();
    try {
      await box.put(user.name, user);
      return true;
    } catch (e) {
      return false;
    } finally {
      await box.close();
    }
  }

  @override
  Future<bool> login(User user) async {
    final currentUser = await getCurrentUser();
    if (currentUser == null) return false;
    if (user.name == currentUser.name &&
        user.password == currentUser.password) {
      _authLoginLockDataSource.onLoginSuccess();
      return true;
    }

    await _authLoginLockDataSource.onLoginFailed();
    return false;
  }

  Future<Box<AccountEntity>> _getUserBox() async {
    final encryptionKey = await _secureStorage.getDbEncryptionKey();
    return Hive.openBox(
      accountBox,
      encryptionCipher: HiveAesCipher(encryptionKey!),
    );
  }

  @override
  Future<void> deleteAll() async {
    final box = await _getUserBox();
    await box.clear();
    await _authLoginLockDataSource.deleteAll();
    return;
  }

  @override
  Future<void> updatePassword(String password) async {
    final box = await _getUserBox();
    try {
      final user = await box.values.cast().first as AccountEntity;
      await box.put(user.key, user.copyWith(password: password));
      return;
    } catch (e) {
      return Future.error(e);
    } finally {
      await box.close();
    }
  }
}