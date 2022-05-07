import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/usecase/auth/auth_lock_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/auth/get_current_account_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/auth/login_use_case.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._getCurrentAccountUseCase,
    this._loginUseCase,
    this._authLockUseCase,
  ) : super(LoginState(loginLoadState: LoadState.none)) {
    on<LoginInitializeEvent>(_initialize);
    on<ConfirmLoginEvent>(_onConfirmLogin);
  }

  // Maybe convert to get acc name only
  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final LoginUseCase _loginUseCase;
  final AuthLockUseCase _authLockUseCase;

  User _inputUserData = const User();

  FutureOr<void> _initialize(
    LoginInitializeEvent event,
    Emitter<LoginState> emit,
  ) async {
    final user = await _getCurrentAccountUseCase.execute(null);
    if (user != null) {
      emit(state.copyWith(user: user));
    }
  }

  FutureOr<void> _onConfirmLogin(
    ConfirmLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    int lockTimeRemaining = await _authLockUseCase.getLockRemainingTime();
    if (lockTimeRemaining > 0) {
      emit(state.copyWith(
        loginLoadState: LoadState.failure,
        lockTimeRemaining: lockTimeRemaining,
      ));
    } else {
      final result = await _loginUseCase.execute(_inputUserData);
      if (result) {
        emit(state.copyWith(loginLoadState: LoadState.success));
      } else {
        lockTimeRemaining = await _authLockUseCase.getLockRemainingTime();
        emit(state.copyWith(
          loginLoadState: LoadState.failure,
          lockTimeRemaining: lockTimeRemaining,
        ));
      }
    }
  }

  void onPasswordChanged(String value) {
    _inputUserData = _inputUserData.copyWith(password: value);
  }

  void onNameChanged(String value) {
    _inputUserData = _inputUserData.copyWith(name: value);
  }
}
