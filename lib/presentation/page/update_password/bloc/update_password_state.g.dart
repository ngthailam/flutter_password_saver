// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdatePasswordStateCWProxy {
  UpdatePasswordState loadState(LoadState loadState);

  UpdatePasswordState savePasswordLoadState(LoadState savePasswordLoadState);

  UpdatePasswordState user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdatePasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdatePasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdatePasswordState call({
    LoadState? loadState,
    LoadState? savePasswordLoadState,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdatePasswordState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdatePasswordState.copyWith.fieldName(...)`
class _$UpdatePasswordStateCWProxyImpl implements _$UpdatePasswordStateCWProxy {
  final UpdatePasswordState _value;

  const _$UpdatePasswordStateCWProxyImpl(this._value);

  @override
  UpdatePasswordState loadState(LoadState loadState) =>
      this(loadState: loadState);

  @override
  UpdatePasswordState savePasswordLoadState(LoadState savePasswordLoadState) =>
      this(savePasswordLoadState: savePasswordLoadState);

  @override
  UpdatePasswordState user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdatePasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdatePasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdatePasswordState call({
    Object? loadState = const $CopyWithPlaceholder(),
    Object? savePasswordLoadState = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return UpdatePasswordState(
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      savePasswordLoadState:
          savePasswordLoadState == const $CopyWithPlaceholder() ||
                  savePasswordLoadState == null
              ? _value.savePasswordLoadState
              // ignore: cast_nullable_to_non_nullable
              : savePasswordLoadState as LoadState,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $UpdatePasswordStateCopyWith on UpdatePasswordState {
  /// Returns a callable class that can be used as follows: `instanceOfUpdatePasswordState.copyWith(...)` or like so:`instanceOfUpdatePasswordState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdatePasswordStateCWProxy get copyWith =>
      _$UpdatePasswordStateCWProxyImpl(this);
}
