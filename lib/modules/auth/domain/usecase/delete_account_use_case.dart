import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAccountUseCase extends BaseUseCase<void, void> {
  DeleteAccountUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<void> execute(void input) {
    return _authRepository.deleteAccount();
  }
}