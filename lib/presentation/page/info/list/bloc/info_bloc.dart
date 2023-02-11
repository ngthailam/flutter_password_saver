// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/usecase/info/delete_info_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/info/get_all_info_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/info/save_info_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/info/search_info_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_events.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

@injectable
class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc(
    this._getAllInfosUseCase,
    this._getCurrentAccountUseCase,
    this._accountPreferenceUseCase,
    this._deleteInfoUseCase,
    this._searchInfoUseCase,
    this._saveInfoUsecase,
  ) : super(InfoState()) {
    on<InfoInitializeEvent>(_initialize);
    on<SearchInfoEvent>(_searchInfo);
    on<InfoRefreshDataEvent>(_refreshData);
    on<DeleteInfoEvent>(_deleteInfo);
    on<UndoDeleteInfoEvent>(_undoDelete);
  }

  final GetAllInfosUseCase _getAllInfosUseCase;
  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final AccountPreferenceUseCase _accountPreferenceUseCase;
  final DeleteInfoUseCase _deleteInfoUseCase;
  final SearchInfoUseCase _searchInfoUseCase;
  final SaveInfoUsecase _saveInfoUsecase;

  AccountPreference? _accountPreference;
  AccountPreference? get accountPreference => _accountPreference;

  bool get isSearching => state.searchKeyword.isNotEmpty == true;

  Info? _lastDeleteInfo;

  FutureOr<void> _initialize(
    InfoInitializeEvent event,
    Emitter<InfoState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    final User? user = await _getCurrentAccountUseCase.execute(null);
    if (user != null) {
      emit(state.copyWith(user: user));
      add(InfoRefreshDataEvent());
    }
  }

  FutureOr<void> _searchInfo(
      SearchInfoEvent event, Emitter<InfoState> emit) async {
    final result = await _searchInfoUseCase.execute(event.keyword);
    if (result != state.infos) {
      emit(state.copyWith(
        loadState: LoadState.success,
        infos: result,
        searchKeyword: event.keyword,
      ));
    }
  }

  FutureOr<void> _refreshData(
      InfoRefreshDataEvent event, Emitter<InfoState> emit) {
    _reLoadPrefs();
    _reloadInfos();
  }

  _reloadInfos() {
    if (isSearching) {
      add(SearchInfoEvent(keyword: state.searchKeyword));
    } else {
      _getInfos();
    }
  }

  Future _reLoadPrefs() async {
    _accountPreference = await _accountPreferenceUseCase.getAccountPrefs();
  }

  Future _getInfos() async {
    final result = await _getAllInfosUseCase.execute(null);
    if (result != state.infos) {
      emit(state.copyWith(loadState: LoadState.success, infos: result));
    }
  }

  FutureOr<void> _deleteInfo(
    DeleteInfoEvent event,
    Emitter<InfoState> emit,
  ) async {
    _lastDeleteInfo =
        state.infos.firstWhereOrNull((element) => element.id == event.infoId);
    await _deleteInfoUseCase.execute(event.infoId);
    _reloadInfos();
  }

  FutureOr<void> _undoDelete(
    UndoDeleteInfoEvent event,
    Emitter<InfoState> emit,
  ) async {
    if (_lastDeleteInfo == null) return;
    await _saveInfoUsecase.execute(_lastDeleteInfo!);
    _reloadInfos();
  }
}
