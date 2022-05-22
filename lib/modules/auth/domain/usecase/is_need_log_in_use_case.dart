import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class IsNeedLogInUseCase implements BaseUseCase<void, bool> {
  IsNeedLogInUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<bool> execute(void inpu) {
    return _authRepository.isNeedLogin();
  }
}
