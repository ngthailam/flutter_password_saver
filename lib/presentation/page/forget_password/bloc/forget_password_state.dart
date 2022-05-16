import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/register/util/security_question.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'forget_password_state.g.dart';

abstract class ForgetPasswordState {}

@CopyWith()
class FpQuestionState extends ForgetPasswordState {
  final LoadState loadState;
  final SecurityQuestion? question;
  final bool? isAnswerCorrect;

  FpQuestionState({
    this.loadState = LoadState.none,
    this.question,
    this.isAnswerCorrect,
  });

  factory FpQuestionState.inital() => FpQuestionState(
        loadState: LoadState.none,
      );
}

@CopyWith()
class FpNoQuestionState extends ForgetPasswordState {
  final LoadState deleteLoadState;

  FpNoQuestionState({this.deleteLoadState = LoadState.none});
}

@CopyWith()
class FpRenewPassState extends ForgetPasswordState with EquatableMixin {
  final String? newPassword;
  final LoadState loadState;
  final String? userName;

  FpRenewPassState({
    this.newPassword,
    this.loadState = LoadState.none,
    this.userName,
  });

  @override
  List<Object?> get props => [
        newPassword,
        loadState,
        userName,
      ];
}
