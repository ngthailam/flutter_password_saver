import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'save_info_state.g.dart';

@CopyWith()
class SaveInfoState {
  SaveInfoState({this.loadState = LoadState.none, this.info});

  final LoadState loadState;
  final Info? info;
}
