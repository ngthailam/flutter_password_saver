import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/delete_account_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/update_account_password_use_case.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/register/util/security_question.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_event.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc(
    this._getCurrentAccountUseCase,
    this._deleteAccountUseCase,
    this._accountPasswordUseCase,
  ) : super(FpQuestionState.inital()) {
    on<InitializeForgetPasswordEvent>(_initialize);
    on<AnswerQuestionEvent>(_checkAnswer);
    on<DeleteAccountEvent>(_deleteAccount);
    on<RenewPasswordEvent>(_savePassword);
  }

  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final UpdateAccountPasswordUseCase _accountPasswordUseCase;

  FutureOr<void> _initialize(
    InitializeForgetPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    final currentState = state as FpQuestionState;
    emit(currentState.copyWith(loadState: LoadState.loading));
    final account = await _getCurrentAccountUseCase.execute(null);
    final hasSecurityQuestion = account?.securityQuestionId != null;

    if (account == null) {
      emit(currentState.copyWith(loadState: LoadState.failure));
      return;
    }

    if (hasSecurityQuestion) {
      final question = SecurityQuestion.questionList()
          .firstWhere((e) => e.id == account.securityQuestionId)
          .copyWith(answer: account.securityQuestionAnswer);
      emit(FpQuestionState(loadState: LoadState.success, question: question));
    } else {
      emit(FpNoQuestionState());
    }
  }

  FutureOr<void> _checkAnswer(
    AnswerQuestionEvent event,
    Emitter<ForgetPasswordState> emit,
  ) {
    final isAnswerCorrect =
        event.answer == (state as FpQuestionState).question!;
    if (isAnswerCorrect) {
      emit(FpRenewPassState());
    } else {
      emit((state as FpQuestionState).copyWith(isAnswerCorrect: false));
    }
  }

  FutureOr<void> _deleteAccount(
    DeleteAccountEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    final currentState = state as FpNoQuestionState;
    emit(currentState.copyWith(deleteLoadState: LoadState.loading));
    await _deleteAccountUseCase.execute(null);
    emit(currentState.copyWith(deleteLoadState: LoadState.success));
  }

  FutureOr<void> _savePassword(
    RenewPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    final currentState = state as FpRenewPassState;
    emit(currentState.copyWith(loadState: LoadState.loading));
    await _accountPasswordUseCase.execute(event.password);
    emit(currentState.copyWith(loadState: LoadState.success));
  }
}
