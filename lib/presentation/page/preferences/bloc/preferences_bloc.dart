import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/delete_account_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_event.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PreferencesBloc extends Bloc<PreferenceEvent, PreferenceState> {
  PreferencesBloc(
    this._accountPreferenceUseCase,
    this._getCurrentAccountUseCase,
    this._deleteAccountUseCase,
  ) : super(PreferenceState()) {
    on<PreferenceInitEvent>(_initialize);
    on<SavePreferenceEvent>(_savePreference);
    on<DeleteAccountEvent>(_deleteAccount);
  }

  final AccountPreferenceUseCase _accountPreferenceUseCase;
  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  FutureOr<void> _initialize(
    PreferenceInitEvent event,
    Emitter<PreferenceState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    try {
      final currentAccount = await _getCurrentAccountUseCase.execute(null);
      final pref = await _accountPreferenceUseCase.getAccountPrefs();
      emit(state.copyWith(
        preference: pref,
        loadState: LoadState.success,
        user: currentAccount,
      ));
    } catch (e) {
      emit(state.copyWith(loadState: LoadState.failure));
    }
  }

  FutureOr<void> _deleteAccount(
    DeleteAccountEvent event,
    Emitter<PreferenceState> emit,
  ) async {
    emit(state.copyWith(deleteLoadState: LoadState.loading));
    try {
      await _deleteAccountUseCase.execute(null);
      emit(state.copyWith(deleteLoadState: LoadState.success));
    } catch (e) {
      emit(state.copyWith(deleteLoadState: LoadState.failure));
    }
  }

  FutureOr<void> _savePreference(
    SavePreferenceEvent event,
    Emitter<PreferenceState> emit,
  ) async {
    await _accountPreferenceUseCase.saveAccountPreference(
      name: event.name,
      value: event.value,
    );
    final preferences = await _accountPreferenceUseCase.getAccountPrefs();
    emit(state.copyWith(preference: preferences));
  }
}
