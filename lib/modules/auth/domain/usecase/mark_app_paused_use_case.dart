import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarkAppPausedUseCase extends BaseUseCase<void, void> {
  MarkAppPausedUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(void input) {
    return _authRepository.markLastLoggedInActive();
  }
}
