import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/auth_lock_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/biometric_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/login_use_case.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/authen/bloc/authen_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenCubit extends Cubit<AuthenState> {
  AuthenCubit(
    this._loginUseCase,
    this._authLockUseCase,
    this._biometricsUseCase,
    this._getCurrentAccountUseCase,
  ) : super(AuthenState.initial());

  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final LoginUseCase _loginUseCase;
  final AuthLockUseCase _authLockUseCase;
  final BiometricsUseCase _biometricsUseCase;

  Future<void> initialize() async {
    final user = await _getCurrentAccountUseCase.execute(null);
    if (user != null) {
      final canUseBiometrics = await _biometricsUseCase.canUseBiometrics();
      emit(state.copyWith(user: user, canUseBiometrics: canUseBiometrics));
      if (canUseBiometrics) {
        final availableBiometrics =
            await _biometricsUseCase.getAvailableBiometrics();
        if (availableBiometrics.isNotEmpty) {
          authenByBio();
        }
      }
    }
  }

  Future<void> authenByPassword(String inputPassword) async {
    int lockTimeRemaining = await _authLockUseCase.getLockRemainingTime();
    final attemptCount = await _authLockUseCase.getLoginAttemptCount();
    if (lockTimeRemaining > 0) {
      emit(state.copyWith(
        loadState: LoadState.failure,
        lockTimeRemaining: lockTimeRemaining,
      ));
    } else {
      final result = await _loginUseCase.execute(User(
        name: state.user!.name,
        password: inputPassword,
      ));
      if (result) {
        emit(state.copyWith(loadState: LoadState.success));
      } else {
        lockTimeRemaining = await _authLockUseCase.getLockRemainingTime();
        emit(state.copyWith(
          loadState: LoadState.failure,
          lockTimeRemaining: lockTimeRemaining,
          attemptCount:
              attemptCount, // Use this to avoid 1 + 2 first 2 errors have same state
        ));
      }
    }
  }

  Future<void> authenByBio() async {
    final inSuccess = await _biometricsUseCase.authenticate(
        reason: 'Use biometrics to login');
    if (inSuccess) {
      emit(state.copyWith(loadState: LoadState.success));
    }
  }
}
