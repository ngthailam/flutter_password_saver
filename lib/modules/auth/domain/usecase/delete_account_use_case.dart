import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:flutter_password_saver/util/app_short_cut_manager.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAccountUseCase extends BaseUseCase<void, void> {
  DeleteAccountUseCase(this._authRepository, this._appShortcutManager,);

  final AuthRepository _authRepository;
  final AppShortcutManager _appShortcutManager;

  @override
  Future<void> execute(void input) {
    return _authRepository.deleteAccount()
      .then((value) => _appShortcutManager.removeAll());
  }
}
