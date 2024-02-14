import 'package:flutter_password_saver/data/entity/account_preference_entity.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AccountPreferenceLocalDataSource {
  Future<AccountPreferenceEntity> getAccountPrefs();

  Future<void> saveRequireLogin(bool require);

  Future<void> deleteAll();

  Future<void> enableDarkMode(bool enable);

  Future<void> setLanguageCode(String value);

  Future<void> saveShowAccName(bool value);

  Future<void> saveAllowSearchAccName(bool value);

  Future<void> saveRequirePassOnForeground(bool value);

  bool fastGetAllowSearchAccName();
}

// To improve a tiny bit of performance when user uses search too much
bool _allowSearchAccName = true;

@Injectable(as: AccountPreferenceLocalDataSource)
class AccountPreferenceLocalDataSourceImpl
    extends AccountPreferenceLocalDataSource {
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<AccountPreferenceEntity> getAccountPrefs() async {
    final sharedPrefs = await _prefs;

    return AccountPreferenceEntity(
      items: AppPreferenceEnum.values
          .map((e) => AccountPreferenceItem(
              name: e, value: getOrDefault(sharedPrefs, e)))
          .toList(),
    );
  }

  dynamic getOrDefault(
    SharedPreferences sharedPref,
    AppPreferenceEnum prefEnum,
  ) {
    return sharedPref.get(prefEnum.name) ?? prefEnum.defaultValue;
  }

  @override
  Future<void> saveRequireLogin(bool require) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(AppPreferenceEnum.requireReLogin.name, require);
  }

  @override
  Future<void> deleteAll() async {
    final sharedPrefs = await _prefs;
    sharedPrefs.clear();
  }

  @override
  Future<void> enableDarkMode(bool enable) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(AppPreferenceEnum.enableDarkMode.name, enable);
  }

  @override
  Future<void> setLanguageCode(String value) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setString(AppPreferenceEnum.languageCode.name, value);
  }

  @override
  Future<void> saveShowAccName(bool value) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(AppPreferenceEnum.showAccName.name, value);
  }

  @override
  Future<void> saveRequirePassOnForeground(bool value) async {
    final sharedPrefs = await _prefs;
    sharedPrefs.setBool(AppPreferenceEnum.requirePassOnForeground.name, value);
  }

  @override
  Future<void> saveAllowSearchAccName(bool value) async {
    final sharedPrefs = await _prefs;
    _allowSearchAccName = value;
    sharedPrefs.setBool(AppPreferenceEnum.allowSearchAccName.name, value);
  }

  @override
  bool fastGetAllowSearchAccName() {
    return _allowSearchAccName;
  }
}
