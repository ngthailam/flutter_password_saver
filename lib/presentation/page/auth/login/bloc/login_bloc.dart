import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/usecase/auth/get_current_account_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/auth/login_use_case.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._getCurrentAccountUseCase, this._loginUseCase)
      : super(LoginState(loginLoadState: LoadState.none)) {
    on<LoginInitializeEvent>(_initialize);
    on<ConfirmLoginEvent>(_onConfirmLogin);
  }

  // Maybe convert to get acc name only
  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final LoginUseCase _loginUseCase;

  User _inputUserData = User();

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
    final result = await _loginUseCase.execute(_inputUserData);
    emit(state.copyWith(
        loginLoadState: result ? LoadState.success : LoadState.failure));
  }

  void onPasswordChanged(String value) {
    _inputUserData = _inputUserData.copyWith(password: value);
  }

  void onNameChanged(String value) {
    _inputUserData = _inputUserData.copyWith(name: value);
  }
}
