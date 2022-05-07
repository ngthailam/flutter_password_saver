import 'package:flutter_password_saver/data/datasource/account_preference_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/auth_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/password_local_data_source.dart';
import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/repository/account_pref_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AccountPrefRepo)
class AccountPrefRepoImpl extends AccountPrefRepo {
  AccountPrefRepoImpl(
      this._accountPreferenceLocalDataSource,
      this._passwordLocalDataSource,
      this._authLocalDataSource,
      this._secureStorage);

  final AccountPreferenceLocalDataSource _accountPreferenceLocalDataSource;
  final PasswordLocalDataSource _passwordLocalDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final SecureStorage _secureStorage;

  @override
  Future<AccountPreference> getAccountPrefs() {
    return _accountPreferenceLocalDataSource
        .getAccountPrefs()
        .then((value) => value.toModel());
  }

  @override
  Future<void> saveAlwaysShowPassword(bool alwaysShow) {
    return _accountPreferenceLocalDataSource.saveAlwaysShowPassword(alwaysShow);
  }

  @override
  Future<void> saveRequireLogin(bool require) {
    return _accountPreferenceLocalDataSource.saveRequireLogin(require);
  }

  @override
  Future<void> deleteAccount() async {
    _passwordLocalDataSource.deleteAll();
    await _authLocalDataSource.deleteAll();
    await _accountPreferenceLocalDataSource.deleteAll();
    return;
  }
}
