import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/usecase/password/delete_password_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/password/get_all_paswords_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/password/search_password_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/password/update_password_settings_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/user/show_onboard_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc(
    this._getAllPasswordsUseCase,
    this._deletePasswordUseCase,
    this._searchPasswordUseCase,
    this._getCurrentAccountUseCase,
    this._updatePasswordSettingsUseCase,
    this._accountPreferenceUseCase,
    this._showOnboardUseCase,
  ) : super(PasswordState()) {
    on<InitializeEvent>(_initialize);
    on<RefreshDataEvent>(_refreshData);
    on<GetPasswordEvent>(_getPasswords);
    on<DeletePasswordEvent>(_deletePassword);
    on<SearchPasswordEvent>(_searchPassword);
    on<UpdateSettingsEvent>(_updateSettings);
    on<HasShownOnboardEvent>(_onHasShownOnboard);
  }

  final GetAllPasswordsUseCase _getAllPasswordsUseCase;
  final DeletePasswordUseCase _deletePasswordUseCase;
  final SearchPasswordUseCase _searchPasswordUseCase;
  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final UpdatePasswordSettingsUseCase _updatePasswordSettingsUseCase;
  final AccountPreferenceUseCase _accountPreferenceUseCase;
  final ShowOnboardUseCase _showOnboardUseCase;

  bool get isSearching => state.searchKeyword.isNotEmpty;

  bool hasShownOnboardThisSession = false;

  AccountPreference? _accountPreference;
  AccountPreference? get accountPreference => _accountPreference;

  FutureOr<void> _getPasswords(
    GetPasswordEvent event,
    Emitter<PasswordState> emit,
  ) async {
    final result = await _getAllPasswordsUseCase.execute(null);
    emit(state.copyWith(loadState: LoadState.success, passwords: result));
  }

  FutureOr<void> _deletePassword(
    DeletePasswordEvent event,
    Emitter<PasswordState> emit,
  ) async {
    await _deletePasswordUseCase.execute(event.id);
    _reloadPasswords();
  }

  FutureOr<void> _searchPassword(
    SearchPasswordEvent event,
    Emitter<PasswordState> emit,
  ) async {
    final result = await _searchPasswordUseCase.execute(event.keyword);
    emit(state.copyWith(
      loadState: LoadState.success,
      passwords: result,
      searchKeyword: event.keyword,
    ));
  }

  _reloadPasswords() {
    if (isSearching) {
      add(SearchPasswordEvent(keyword: state.searchKeyword));
    } else {
      add(GetPasswordEvent());
    }
  }

  _reLoadPrefs() async {
    _accountPreference = await _accountPreferenceUseCase.getAccountPrefs();
  }

  FutureOr<void> _initialize(
    InitializeEvent event,
    Emitter<PasswordState> emit,
  ) async {
    final User? user = await _getCurrentAccountUseCase.execute(null);
    if (user != null) {
      final bool showOnboard = await _showOnboardUseCase.isShowOnboard();
      emit(state.copyWith(user: user, shouldShowOnboard: showOnboard));
      add(RefreshDataEvent());
    }
  }

  FutureOr<void> _updateSettings(
    UpdateSettingsEvent event,
    Emitter<PasswordState> emit,
  ) async {
    await _updatePasswordSettingsUseCase.execute(
      PasswordSettings(
        passwordId: event.passwordId,
        name: event.name,
        value: event.value,
      ),
    );
    _reloadPasswords();
  }

  FutureOr<void> _refreshData(
    RefreshDataEvent event,
    Emitter<PasswordState> emit,
  ) {
    _reLoadPrefs();
    _reloadPasswords();
  }

  FutureOr<void> _onHasShownOnboard(
    HasShownOnboardEvent event,
    Emitter<PasswordState> emit,
  ) async {
    hasShownOnboardThisSession = true;
    await _showOnboardUseCase.setHasShownOnboard();
  }
}
