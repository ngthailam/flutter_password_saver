import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShowOnboardUseCase {
  ShowOnboardUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<bool> isShowOnboard() {
    return _authRepository.isFirstTimeLogin();
  }

  Future<void> setHasShownOnboard() {
    return _authRepository.setIsFirstTimeLogin(false);
  }
}
