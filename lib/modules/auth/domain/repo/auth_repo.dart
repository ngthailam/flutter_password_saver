import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:local_auth/local_auth.dart';

abstract class AuthRepository {
  Future<bool> createAccount(User user);

  Future<User?> getCurrentAccount();

  Future<bool> login(User user);

  Future<void> deleteAccount();

  Future<void> updatePassword(String password);

  Future<int> getLockRemainingTime();

  Future<int> getLoginAttemptCount();

  Future<bool> canUseBiometrics();

  Future<bool> authenticate({required String reason});

  Future<List<BiometricType>> getAvailableBiometrics();

  bool isLoggedIn();

  Future<bool> isNeedLogin();

  Future<bool> isFirstTimeLogin();

  Future<void> setIsFirstTimeLogin(bool isFirstTime);
}
