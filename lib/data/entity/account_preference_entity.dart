import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:collection/collection.dart';

part 'account_preference_entity.g.dart';

@CopyWith()
class AccountPreferenceEntity {
  static const keyRequireLogin = 'requireLogin';
  static const keyAlwaysShowPasswords = 'alwaysShowPasswords';

  AccountPreferenceEntity({
    this.requireLogin = AccountPreference.requireLoginDefault,
    this.alwaysShowPasswords = AccountPreference.alwaysShowPasswordsDefault,
  });

  final bool requireLogin;
  final bool alwaysShowPasswords;

  factory AccountPreferenceEntity.fromAccountPreference(
      AccountPreference preference) {
    return AccountPreferenceEntity(
      requireLogin: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.requirePass)
              ?.value ??
          AccountPreference.requireLoginDefault,
      alwaysShowPasswords: preference.items
              .firstWhereOrNull(
                  (element) => element.name == PreferenceName.alwaysShowPass)
              ?.value ??
          AccountPreference.alwaysShowPasswordsDefault,
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
        ],
      );
}
