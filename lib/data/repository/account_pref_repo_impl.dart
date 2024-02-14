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
  Future<void> saveAccountPreference(
      {required PreferenceName name, required value}) {
    switch (name) {
      case PreferenceName.requirePass:
        return _accountPreferenceLocalDataSource
            .saveRequireLogin(value as bool);
      case PreferenceName.enableDarkMode:
        return _accountPreferenceLocalDataSource.enableDarkMode(value as bool);
      case PreferenceName.languageCode:
        return _accountPreferenceLocalDataSource
            .setLanguageCode(value as String);
      case PreferenceName.showAccName:
        return _accountPreferenceLocalDataSource.saveShowAccName(value as bool);
      case PreferenceName.allowSearchAccName:
        return _accountPreferenceLocalDataSource
            .saveAllowSearchAccName(value as bool);
      case PreferenceName.requirePassOnForeground:
        return _accountPreferenceLocalDataSource
            .saveRequirePassOnForeground(value as bool);
      default:
        return Future.error(Exception('Not implemented'));
    }
  }
}
