import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/data/util/id_generator.dart';
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

  Password? _preFetchPassword;
  late Password _inputPassword;

  bool get isDataChanged => _preFetchPassword != _inputPassword;

  FutureOr<void> _prefetchPassword(
    PasswordSavePrefetchEvent event,
    Emitter<PasswordSaveState> emit,
  ) async {
    if (event.passwordId == null) {
      final randomId = generateRandomUuid();
      _inputPassword = Password(
        id: randomId,
        settings: Password.defaultSettings(
          passwordId: randomId,
        ),
      );
      return;
    }

    try {
      final password = await _getPasswordByIdUseCase.execute(event.passwordId!);
      if (password != null) {
        _inputPassword = password;
        _preFetchPassword = password;
      }
      emit(state.copyWith(password: password ?? _inputPassword));
    } catch (e) {
      // Do nothing
    }
  }

  FutureOr<void> _createPassword(
    PasswordSaveEvent event,
    Emitter<PasswordSaveState> emit,
  ) async {
    final passwordToSave = _inputPassword.copyWith(
      createdAt: _inputPassword.createdAt == 0
          ? DateTime.now().millisecondsSinceEpoch
          : _inputPassword.createdAt,
    );
    await _savePasswordUsecase.execute(passwordToSave);
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
