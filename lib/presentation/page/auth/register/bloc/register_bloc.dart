import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/usecase/auth/create_account_use_case.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._createAccountUseCase)
      : super(RegisterState(loadState: LoadState.none)) {
    on<ConfirmNameEvent>(_confirmName);
    on<ConfirmPasswordEvent>(_confirmPassword);
    on<ConfirmSecurityQuestionEvent>(_confirmSecurityQuestion);
  }

  final CreateAccountUseCase _createAccountUseCase;

  User _user = const User();

  String get inputUserName => _user.name;

  FutureOr<void> _confirmName(
    ConfirmNameEvent event,
    Emitter<RegisterState> emit,
  ) {
    _user = _user.copyWith(name: event.name);
  }

  FutureOr<void> _confirmPassword(
    ConfirmPasswordEvent event,
    Emitter<RegisterState> emit,
  ) async {
    _user = _user.copyWith(password: event.password);
  }

  FutureOr<void> _confirmSecurityQuestion(
    ConfirmSecurityQuestionEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    _user = _user.copyWith(
      securityQuestionId: event.question?.id,
      securityQuestionAnswer: event.question?.answer,
    );
    await _createAccountUseCase.execute(_user);
    emit(state.copyWith(loadState: LoadState.success));
  }
}
