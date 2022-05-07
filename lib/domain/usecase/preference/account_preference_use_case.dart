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

  Future<void> saveRequireLogin(bool require) {
    return _accountPrefRepo.saveRequireLogin(require);
  }

  Future<void> saveAlwaysShowPassword(bool alwaysShow) {
    return _accountPrefRepo.saveAlwaysShowPassword(alwaysShow);
  }
}
