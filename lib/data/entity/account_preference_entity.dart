import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';

part 'account_preference_entity.g.dart';

@CopyWith()
class AccountPreferenceEntity {
  static const keyRequireLogin = 'requireLogin';
  static const keyEnableDarkMode = 'enableDarkMode';
  static const keyLanguageCode = 'languageCode';
  static const keyShowAccName = 'showAccName';

  AccountPreferenceEntity({
    required this.requireLogin,
    required this.enableDarkMode,
    required this.languageCode,
    required this.showAccName,
  });

  final bool requireLogin;
  final bool enableDarkMode;
  final String languageCode;
  final bool showAccName;

  factory AccountPreferenceEntity.fromAccountPreference(
      AccountPreference preference) {
    return AccountPreferenceEntity(
      // Require login
      requireLogin:
          preference.getItemByName(PreferenceName.requirePass)?.value ??
              AccountPreference.requireLoginDefault,
      // Dark mode
      enableDarkMode:
          preference.getItemByName(PreferenceName.enableDarkMode)?.value ??
              AccountPreference.enableDarkModeDefault,
      // Language code
      languageCode:
          preference.getItemByName(PreferenceName.languageCode)?.value ??
              AccountPreference.languageCodeDefault,
      // Show acc name always
      showAccName:
          preference.getItemByName(PreferenceName.showAccName)?.value ??
              AccountPreference.showAccountNameDefault,
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
          AccountPreferenceItem(
            name: PreferenceName.showAccName,
            value: showAccName,
          ),
        ],
      );
}
