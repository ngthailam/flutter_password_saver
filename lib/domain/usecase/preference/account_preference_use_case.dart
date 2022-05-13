import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/repository/account_pref_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@injectable
class AccountPreferenceUseCase {
  AccountPreferenceUseCase(this._accountPrefRepo);

  final AccountPrefRepo _accountPrefRepo;

  Future<AccountPreference> getAccountPrefs() {
    return _accountPrefRepo.getAccountPrefs();
  }

  Future<bool> getIsDarkModeEnabled() {
    return getAccountPrefs().then((value) {
      return value.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.enableDarkMode)
              ?.value ??
          AccountPreference.enableDarkModeDefault;
    });
  }

  Future<void> saveAccountPreference({
    required PreferenceName name,
    required dynamic value,
  }) {
    return _accountPrefRepo.saveAccountPreference(
      name: name,
      value: value,
    );
  }
}
