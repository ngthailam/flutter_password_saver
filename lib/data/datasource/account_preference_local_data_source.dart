import 'package:flutter_password_saver/data/entity/account_preference_entity.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AccountPreferenceLocalDataSource {
  Future<AccountPreferenceEntity> getAccountPrefs();

  Future<void> saveRequireLogin(bool require);

  Future<void> saveAlwaysShowPassword(bool alwaysShow);

  Future<void> deleteAll();

  Future<void> enableDarkMode(bool enable);

  Future<void> setLanguageCode(String value);
}

@Injectable(as: AccountPreferenceLocalDataSource)
class AccountPreferenceLocalDataSourceImpl
    extends AccountPreferenceLocalDataSource {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<AccountPreferenceEntity> getAccountPrefs() async {
    final sharedPrefs = await _prefs;
    return AccountPreferenceEntity(
      requireLogin:
          sharedPrefs.getBool(AccountPreferenceEntity.keyRequireLogin) ??
              AccountPreference.requireLoginDefault,
      alwaysShowPasswords:
          sharedPrefs.getBool(AccountPreferenceEntity.keyAlwaysShowPasswords) ??
              AccountPreference.alwaysShowPasswordsDefault,
      enableDarkMode:
          sharedPrefs.getBool(AccountPreferenceEntity.keyEnableDarkMode) ??
              AccountPreference.enableDarkModeDefault,
      languageCode:
          sharedPrefs.getString(AccountPreferenceEntity.keyLanguageCode) ??
              AccountPreference.languageCodeDefault,
    );
  }

  @override
  Future<void> saveRequireLogin(bool require) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(AccountPreferenceEntity.keyRequireLogin, require);
  }

  @override
  Future<void> saveAlwaysShowPassword(bool alwaysShow) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(
        AccountPreferenceEntity.keyAlwaysShowPasswords, alwaysShow);
  }

  @override
  Future<void> deleteAll() async {
    final sharedPrefs = await _prefs;
    sharedPrefs.clear();
  }

  @override
  Future<void> enableDarkMode(bool enable) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(AccountPreferenceEntity.keyEnableDarkMode, enable);
  }

  @override
  Future<void> setLanguageCode(String value) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setString(AccountPreferenceEntity.keyLanguageCode, value);
  }
}
