import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:collection/collection.dart';

part 'account_preference_entity.g.dart';

@CopyWith()
class AccountPreferenceEntity {
  static const keyRequireLogin = 'requireLogin';
  static const keyAlwaysShowPasswords = 'alwaysShowPasswords';
  static const keyEnableDarkMode = 'enableDarkMode';

  AccountPreferenceEntity({
    this.requireLogin = AccountPreference.requireLoginDefault,
    this.alwaysShowPasswords = AccountPreference.alwaysShowPasswordsDefault,
    this.enableDarkMode = AccountPreference.enableDarkModeDefault,
  });

  final bool requireLogin;
  final bool alwaysShowPasswords;
  final bool enableDarkMode;

  factory AccountPreferenceEntity.fromAccountPreference(
      AccountPreference preference) {
    return AccountPreferenceEntity(
      // Require login
      requireLogin: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.requirePass)
              ?.value ??
          AccountPreference.requireLoginDefault,
      // Always show password
      alwaysShowPasswords: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.alwaysShowPass)
              ?.value ??
          AccountPreference.alwaysShowPasswordsDefault,
      // Dark mode
      enableDarkMode: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.enableDarkMode)
              ?.value ??
          AccountPreference.enableDarkModeDefault,
    );
  }

  AccountPreference toModel() => AccountPreference(
        items: [
          AccountPreferenceItem(
            name: PreferenceName.requirePass,
            value: requireLogin,
          ),
          AccountPreferenceItem(
            name: PreferenceName.alwaysShowPass,
            value: alwaysShowPasswords,
          ),
          AccountPreferenceItem(
            name: PreferenceName.enableDarkMode,
            value: enableDarkMode,
          ),
        ],
      );
}
