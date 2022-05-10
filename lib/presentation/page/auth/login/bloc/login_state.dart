import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'login_state.g.dart';

@CopyWith()
class LoginState extends Equatable {
  const LoginState({
    required this.loginLoadState,
    this.user,
    this.lockTimeRemaining = 0,
    this.canUseBiometrics = false,
  });

  final LoadState loginLoadState;
  final User? user;
  final int lockTimeRemaining;
  final bool canUseBiometrics;

  @override
  List<Object?> get props => [
        loginLoadState,
        user,
        lockTimeRemaining,
        canUseBiometrics,
      ];
}
