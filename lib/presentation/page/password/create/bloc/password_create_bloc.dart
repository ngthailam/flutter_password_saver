import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/usecase/password/save_password_use_case.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_create_events.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_create_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PasswordCreateBloc
    extends Bloc<PasswordCreateEvent, PasswordCreateState> {
  PasswordCreateBloc(this._savePasswordUsecase) : super(PasswordCreateState()) {
    on<PasswordConfirmCreationEvent>(_createPassword);
  }

  final SavePasswordUsecase _savePasswordUsecase;
  Password _inputPassword = Password();

  FutureOr<void> _createPassword(
    PasswordCreateEvent event,
    Emitter<PasswordCreateState> emit,
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
