import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'password_save_state.g.dart';

@CopyWith()
class PasswordSaveState {
  PasswordSaveState({this.loadState = LoadState.none, this.password});

  final LoadState loadState;
  final Password? password;
}
