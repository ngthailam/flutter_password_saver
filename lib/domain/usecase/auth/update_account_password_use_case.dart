import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
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
