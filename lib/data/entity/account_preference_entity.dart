import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';

part 'account_preference_entity.g.dart';

@CopyWith()
class AccountPreferenceEntity {
  static const keyRequireLogin = 'requireLogin';
  static const keyEnableDarkMode = 'enableDarkMode';
  static const keyLanguageCode = 'languageCode';
  static const keyShowAccName = 'showAccName';
  static const keyRequirePassOnForeground = 'requirePassOnForeground';
  static const keyAllowSearchAccName = 'allowSearchAccName';

  AccountPreferenceEntity({
    required this.requireLogin,
    required this.enableDarkMode,
    required this.languageCode,
    required this.showAccName,
    required this.allowSearchAccName,
    required this.requirePassOnForeground,
  });

  final bool requireLogin;
  final bool enableDarkMode;
  final String languageCode;
  final bool showAccName;
  final bool allowSearchAccName;
  final bool requirePassOnForeground;

  factory AccountPreferenceEntity.fromAccountPreference(
      AccountPreference preference) {
    return AccountPreferenceEntity(
      // Require login
      requireLogin: preference.getItemValue(PreferenceName.requirePass) ??
          AccountPreference.requireLoginDefault,
      // Dark mode
      enableDarkMode: preference.getItemValue(PreferenceName.enableDarkMode) ??
          AccountPreference.enableDarkModeDefault,
      // Language code
      languageCode: preference.getItemValue(PreferenceName.languageCode) ??
          AccountPreference.languageCodeDefault,
      // Show acc name always
      showAccName: preference.getItemValue(PreferenceName.showAccName) ??
          AccountPreference.showAccountNameDefault,
      // Allow user to search account name too
      allowSearchAccName:
          preference.getItemValue(PreferenceName.allowSearchAccName) ??
              AccountPreference.allowSearchAccNameDefault,
      requirePassOnForeground:
          preference.getItemValue(PreferenceName.requirePassOnForeground) ??
              AccountPreference.requirePassOnForeground,
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
          AccountPreferenceItem(
            name: PreferenceName.allowSearchAccName,
            value: allowSearchAccName,
          ),
          AccountPreferenceItem(
            name: PreferenceName.requirePassOnForeground,
            value: requirePassOnForeground,
          ),
        ],
      );
}
