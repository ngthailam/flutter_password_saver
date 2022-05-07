import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

part 'preferences_state.g.dart';

@CopyWith()
class PreferenceState {
  PreferenceState({
    this.user,
    this.preference,
    this.loadState = LoadState.none,
    this.deleteLoadState = LoadState.none,
  });

  final LoadState loadState;
  final User? user;
  final AccountPreference? preference;
  final LoadState deleteLoadState;
}
