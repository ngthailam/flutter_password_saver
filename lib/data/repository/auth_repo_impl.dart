import 'package:flutter_password_saver/data/datasource/account_preference_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/auth_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/auth_login_lock_data_source.dart';
import 'package:flutter_password_saver/data/datasource/biometric_data_source.dart';
import 'package:flutter_password_saver/data/datasource/password_local_data_source.dart';
import 'package:flutter_password_saver/data/entity/user_entity.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth_platform_interface/types/biometric_type.dart';

@Injectable(as: AuthRepository)
class AuthRepoitoryImpl extends AuthRepository {
  AuthRepoitoryImpl(
    this._authLocalDataSource,
    this._passwordLocalDataSource,
    this._accountPreferenceLocalDataSource,
    this._authLoginLockDataSource,
    this._biometricsDataSource,
  );

  final AuthLocalDataSource _authLocalDataSource;
  final PasswordLocalDataSource _passwordLocalDataSource;
  final AccountPreferenceLocalDataSource _accountPreferenceLocalDataSource;
  final AuthLoginLockDataSource _authLoginLockDataSource;
  final BiometricsDataSource _biometricsDataSource;

  @override
  Future<bool> createAccount(User user) {
    return _authLocalDataSource.saveAccount(UserEntity.fromUser(user));
  }

  @override
  Future<User?> getCurrentAccount() {
    return _authLocalDataSource
        .getCurrentUser()
        .then((value) => value?.toModel());
  }

  @override
  Future<bool> login(User user) {
    return _authLocalDataSource.login(user);
  }

  @override
  Future<void> deleteAccount() async {
    _passwordLocalDataSource.deleteAll();
    await _authLocalDataSource.deleteAll();
    await _accountPreferenceLocalDataSource.deleteAll();
    return;
  }

  @override
  Future<void> updatePassword(String password) {
    return _authLocalDataSource.updatePassword(password);
  }

  @override
  Future<int> getLockRemainingTime() {
    return _authLoginLockDataSource.getRemainingLockTime();
  }

  @override
  Future<int> getLoginAttemptCount() {
    return _authLoginLockDataSource.getAttemptCount();
  }

  @override
  Future<bool> authenticate({required String reason}) {
    return _biometricsDataSource.authenticate(reason: reason);
  }

  @override
  Future<bool> canUseBiometrics() {
    return _biometricsDataSource.canUseBiometrics();
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() {
    return _biometricsDataSource.getAvailableBiometrics();
  }
}
