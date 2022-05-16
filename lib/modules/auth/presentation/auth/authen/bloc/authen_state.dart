import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'authen_state.g.dart';

@CopyWith()
class AuthenState {
  const AuthenState({
    this.loadState = LoadState.none,
    this.lockTimeRemaining = 0,
    this.attemptCount = 0,
    this.canUseBiometrics = false,
    this.user,
  });

  factory AuthenState.initial() => const AuthenState();

  final LoadState loadState;
  final int lockTimeRemaining;
  final int attemptCount;
  final bool canUseBiometrics;
  final User? user;
}
