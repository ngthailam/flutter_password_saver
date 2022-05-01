import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'password_create_state.g.dart';

@CopyWith()
class PasswordCreateState {
  PasswordCreateState({this.loadState = LoadState.none});

  final LoadState loadState;
}
