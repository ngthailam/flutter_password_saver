import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'info_state.g.dart';

@CopyWith()
class InfoState {
  InfoState({
    this.loadState = LoadState.none,
    this.infos = const [],
    this.searchKeyword = '',
    this.user,
  });

  final LoadState loadState;
  final List<Info> infos;
  final String searchKeyword;
  final User? user;
}
