import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/usecase/auth/get_current_account_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_event.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:injectable/injectable.dart';

@injectable
class PreferencesBloc extends Bloc<PreferenceEvent, PreferenceState> {
  PreferencesBloc(
      this._accountPreferenceUseCase, this._getCurrentAccountUseCase)
      : super(PreferenceState()) {
    on<PreferenceInitEvent>(_initialize);
    on<PreferenceSaveRequireLoginEvent>(_saveRequirePassword);
    on<PreferenceSaveAlwaysShowPasswordEvent>(_saveAlwaysShowPasswords);
    on<DeleteAccountEvent>(_deleteAccount);
  }

  final AccountPreferenceUseCase _accountPreferenceUseCase;
  final GetCurrentAccountUseCase _getCurrentAccountUseCase;

  FutureOr<void> _saveRequirePassword(
    PreferenceSaveRequireLoginEvent event,
    Emitter<PreferenceState> emit,
  ) async {
    await _accountPreferenceUseCase.saveRequireLogin(event.requirePassOnLogin);
    emit(
      state.copyWith(
        preference: state.preference?.copyWithNewItem(AccountPreferenceItem(
          name: PreferenceName.requirePass,
          value: event.requirePassOnLogin,
        )),
      ),
    );
  }

  FutureOr<void> _saveAlwaysShowPasswords(
    PreferenceSaveAlwaysShowPasswordEvent event,
    Emitter<PreferenceState> emit,
  ) async {
    await _accountPreferenceUseCase
        .saveAlwaysShowPassword(event.alwaysShowPasswords);
    emit(
      state.copyWith(
        preference: state.preference?.copyWithNewItem(AccountPreferenceItem(
          name: PreferenceName.alwaysShowPass,
          value: event.alwaysShowPasswords,
        )),
      ),
    );
  }

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
      await _accountPreferenceUseCase.deleteAccount();
      emit(state.copyWith(deleteLoadState: LoadState.success));
    } catch (e) {
      emit(state.copyWith(deleteLoadState: LoadState.failure));
    }
  }
}
