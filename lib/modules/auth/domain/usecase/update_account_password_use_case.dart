import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateAccountPasswordUseCase extends BaseUseCase<String, void> {
  final AuthRepository _authRepository;

  UpdateAccountPasswordUseCase(this._authRepository);

  @override
  Future<void> execute(String input) {
    return _authRepository.updatePassword(input);
  }
}
