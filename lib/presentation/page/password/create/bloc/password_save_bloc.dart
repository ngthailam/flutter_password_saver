import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/usecase/password/get_password_by_id_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/password/save_password_use_case.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_events.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PasswordSaveBloc extends Bloc<PasswordSaveEvent, PasswordSaveState> {
  PasswordSaveBloc(this._savePasswordUsecase, this._getPasswordByIdUseCase)
      : super(PasswordSaveState()) {
    on<PasswordSaveConfirmEvent>(_createPassword);
    on<PasswordSavePrefetchEvent>(_prefetchPassword);
  }

  final SavePasswordUsecase _savePasswordUsecase;
  final GetPasswordByIdUseCase _getPasswordByIdUseCase;

  Password _inputPassword = Password();

  FutureOr<void> _prefetchPassword(
    PasswordSavePrefetchEvent event,
    Emitter<PasswordSaveState> emit,
  ) async {
    if (event.passwordId == null) {
      return;
    }

    try {
      final password = await _getPasswordByIdUseCase.execute(event.passwordId!);
      _inputPassword = password;
      emit(state.copyWith(password: password));
    } catch (e) {
      // Do nothing
    }
  }

  FutureOr<void> _createPassword(
    PasswordSaveEvent event,
    Emitter<PasswordSaveState> emit,
  ) async {
    await _savePasswordUsecase.execute(_inputPassword);
    emit(state.copyWith(loadState: LoadState.success));
  }

  void onNameChanged(String text) {
    _inputPassword = _inputPassword.copyWith(name: text);
  }

  void onAccNameChanged(String text) {
    _inputPassword = _inputPassword.copyWith(accName: text);
  }

  void onPasswordChanged(String text) {
    _inputPassword = _inputPassword.copyWith(password: text);
  }
}
