import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:collection/collection.dart';

part 'account_preference_entity.g.dart';

@CopyWith()
class AccountPreferenceEntity {
  static const keyRequireLogin = 'requireLogin';
  static const keyEnableDarkMode = 'enableDarkMode';
  static const keyLanguageCode = 'languageCode';

  AccountPreferenceEntity({
    this.requireLogin = AccountPreference.requireLoginDefault,
    this.enableDarkMode = AccountPreference.enableDarkModeDefault,
    this.languageCode = AccountPreference.languageCodeDefault,
  });

  final bool requireLogin;
  final bool enableDarkMode;
  final String languageCode;

  factory AccountPreferenceEntity.fromAccountPreference(
      AccountPreference preference) {
    return AccountPreferenceEntity(
      // Require login
      requireLogin: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.requirePass)
              ?.value ??
          AccountPreference.requireLoginDefault,
      // Dark mode
      enableDarkMode: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.enableDarkMode)
              ?.value ??
          AccountPreference.enableDarkModeDefault,
      // Language code
      languageCode: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.languageCode)
              ?.value ??
          AccountPreference.languageCodeDefault,
    );
  }

  AccountPreference toModel() => AccountPreference(
        items: [
          AccountPreferenceItem(
            name: PreferenceName.requirePass,
            value: requireLogin,
          ),
          AccountPreferenceItem(
            name: PreferenceName.enableDarkMode,
            value: enableDarkMode,
          ),
          AccountPreferenceItem(
            name: PreferenceName.languageCode,
            value: languageCode,
          ),
        ],
      );
}
