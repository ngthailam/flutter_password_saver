import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'login_state.g.dart';

@CopyWith()
class LoginState {
  LoginState({
    required this.loginLoadState,
    this.user,
  });

  final LoadState loginLoadState;
  final User? user;
}
