import 'package:flutter_password_saver/data/datasource/account_preference_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/auth_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/password_local_data_source.dart';
import 'package:flutter_password_saver/data/entity/user_entity.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepoitoryImpl extends AuthRepository {
  AuthRepoitoryImpl(
    this._authLocalDataSource,
    this._passwordLocalDataSource,
    this._accountPreferenceLocalDataSource,
  );

  final AuthLocalDataSource _authLocalDataSource;
  final PasswordLocalDataSource _passwordLocalDataSource;
  final AccountPreferenceLocalDataSource _accountPreferenceLocalDataSource;

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
}
