import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/repository/account_pref_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountPreferenceUseCase {
  AccountPreferenceUseCase(this._accountPrefRepo);

  final AccountPrefRepo _accountPrefRepo;

  Future<AccountPreference> getAccountPrefs() {
    return _accountPrefRepo.getAccountPrefs();
  }

  Future<bool> getIsDarkModeEnabled() async {
    final prefs = await getAccountPrefs();
    return prefs.getItemValue(AppPreferenceEnum.enableDarkMode) as bool;
  }

  Future<bool> getIsRequirePassOnForeground() async {
    final prefs = await getAccountPrefs();
    return prefs.getItemValue(AppPreferenceEnum.requirePassOnForeground) as bool;
  }

  Future<void> saveAccountPreference({
    required AppPreferenceEnum name,
    required dynamic value,
  }) {
    return _accountPrefRepo.saveAccountPreference(
      name: name,
      value: value,
    );
  }

  Future<String> getLanguageCode() async {
    final prefs = await getAccountPrefs();
    return prefs.getItemValue(AppPreferenceEnum.languageCode) as String;
  }
}
