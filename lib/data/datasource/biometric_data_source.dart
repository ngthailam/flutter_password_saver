import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

abstract class BiometricsDataSource {
  Future<bool> canUseBiometrics();

  Future<bool> authenticate({required String reason});

  Future<List<BiometricType>> getAvailableBiometrics();
}

@Injectable(as: BiometricsDataSource)
class BiometricsDataSourceImpl extends BiometricsDataSource {
  LocalAuthentication get auth => LocalAuthentication();

  @override
  Future<bool> authenticate({required String reason}) {
    return auth.authenticate(
      localizedReason: reason,
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }

  @override
  Future<bool> canUseBiometrics() async {
    final localAuthen = auth;
    final bool canAuthenticate = await localAuthen.canCheckBiometrics ||
        await localAuthen.isDeviceSupported();

    return canAuthenticate;
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return auth.getAvailableBiometrics();
  }
}
