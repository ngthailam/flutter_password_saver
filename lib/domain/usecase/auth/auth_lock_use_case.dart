import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthLockUseCase {
  AuthLockUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<int> getLockRemainingTime() {
    return _authRepository.getLockRemainingTime();
  }
}
