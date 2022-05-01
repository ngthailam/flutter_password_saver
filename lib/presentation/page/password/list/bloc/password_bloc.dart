import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/usecase/password/delete_password_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/password/get_all_paswords_use_case.dart';
import 'package:flutter_password_saver/domain/usecase/password/search_password_use_case.dart';
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
  ) : super(PasswordState()) {
    on<GetPasswordEvent>(_getPasswords);
    on<DeletePasswordEvent>(_deletePassword);
    on<SearchPasswordEvent>(_searchPassword);
  }

  final GetAllPasswordsUseCase _getAllPasswordsUseCase;
  final DeletePasswordUseCase _deletePasswordUseCase;
  final SearchPasswordUseCase _searchPasswordUseCase;

  bool get isSearching => state.searchKeyword.isNotEmpty;

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
    _reload();
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

  _reload() {
    if (isSearching) {
      add(SearchPasswordEvent(keyword: state.searchKeyword));
    } else {
      add(GetPasswordEvent());
    }
  }
}
