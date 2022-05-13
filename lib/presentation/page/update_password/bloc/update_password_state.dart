import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'update_password_state.g.dart';

@CopyWith()
class UpdatePasswordState extends Equatable {
  const UpdatePasswordState({
    this.user,
    this.loadState = LoadState.none,
    this.savePasswordLoadState = LoadState.none,
  });

  final User? user;
  final LoadState loadState;
  final LoadState savePasswordLoadState;

  @override
  List<Object?> get props => [
        user,
        loadState,
        savePasswordLoadState,
      ];
}
