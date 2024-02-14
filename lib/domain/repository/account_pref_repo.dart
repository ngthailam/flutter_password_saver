import 'package:flutter_password_saver/domain/model/account_preference.dart';

abstract class AccountPrefRepo {
  Future<AccountPreference> getAccountPrefs();

  Future<void> saveAccountPreference({
    required AppPreferenceEnum name,
    required dynamic value,
  });
}
