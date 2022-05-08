import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@injectable
class BiometricsUseCase {
  BiometricsUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<bool> canUseBiometrics() {
    return _authRepository.canUseBiometrics();
  }

  Future<bool> authenticate({required String reason}) {
    return _authRepository.authenticate(reason: reason);
  }

  Future<List<BiometricType>> getAvailableBiometrics() {
    return _authRepository.getAvailableBiometrics();
  }
}
