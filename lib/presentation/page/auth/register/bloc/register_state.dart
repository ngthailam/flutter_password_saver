import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'register_state.g.dart';

@CopyWith()
class RegisterState {
  RegisterState({required this.loadState});

  final LoadState loadState;
}
