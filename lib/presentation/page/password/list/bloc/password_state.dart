import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'password_state.g.dart';

@CopyWith()
class PasswordState {
  PasswordState({
    this.loadState = LoadState.none,
    this.passwords = const [],
    this.searchKeyword = '',
    this.user,
    this.shouldShowOnboard = false,
  });

  final LoadState loadState;
  final List<Password> passwords;
  final String searchKeyword;
  final User? user;
  final bool shouldShowOnboard;
}
