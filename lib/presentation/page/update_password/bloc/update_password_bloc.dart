import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/update_account_password_use_case.dart';
import 'package:flutter_password_saver/presentation/page/update_password/bloc/update_password_event.dart';
import 'package:flutter_password_saver/presentation/page/update_password/bloc/update_password_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePasswordBloc
    extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  UpdatePasswordBloc(
    this._getCurrentAccountUseCase,
    this._updateAccountPasswordUseCase,
  ) : super(const UpdatePasswordState()) {
    on<InitializeEvent>(_initialize);
    on<ConfirmNewPasswordEvent>(_onConfirm);
  }

  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final UpdateAccountPasswordUseCase _updateAccountPasswordUseCase;

  FutureOr<void> _initialize(
    InitializeEvent event,
    Emitter<UpdatePasswordState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    final account = await _getCurrentAccountUseCase.execute(null);
    emit(state.copyWith(user: account, loadState: LoadState.success));
  }

  FutureOr<void> _onConfirm(
    ConfirmNewPasswordEvent event,
    Emitter<UpdatePasswordState> emit,
  ) async {
    emit(state.copyWith(savePasswordLoadState: LoadState.loading));
    await _updateAccountPasswordUseCase.execute(event.password);
    emit(state.copyWith(savePasswordLoadState: LoadState.success));
  }
}
