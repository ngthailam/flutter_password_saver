import 'package:flutter_password_saver/data/datasource/account_preference_local_data_source.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/repository/account_pref_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AccountPrefRepo)
class AccountPrefRepoImpl extends AccountPrefRepo {
  AccountPrefRepoImpl(
    this._accountPreferenceLocalDataSource,
  );

  final AccountPreferenceLocalDataSource _accountPreferenceLocalDataSource;

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
}
