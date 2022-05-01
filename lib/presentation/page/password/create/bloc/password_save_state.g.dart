// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_save_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordSaveStateCWProxy {
  PasswordSaveState loadState(LoadState loadState);

  PasswordSaveState password(Password? password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordSaveState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordSaveState(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordSaveState call({
    LoadState? loadState,
    Password? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordSaveState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordSaveState.copyWith.fieldName(...)`
class _$PasswordSaveStateCWProxyImpl implements _$PasswordSaveStateCWProxy {
  final PasswordSaveState _value;

  const _$PasswordSaveStateCWProxyImpl(this._value);

  @override
  PasswordSaveState loadState(LoadState loadState) =>
      this(loadState: loadState);

  @override
  PasswordSaveState password(Password? password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordSaveState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordSaveState(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordSaveState call({
    Object? loadState = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return PasswordSaveState(
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as Password?,
    );
  }
}

extension $PasswordSaveStateCopyWith on PasswordSaveState {
  /// Returns a callable class that can be used as follows: `instanceOfclass PasswordSaveState.name.copyWith(...)` or like so:`instanceOfclass PasswordSaveState.name.copyWith.fieldName(...)`.
  _$PasswordSaveStateCWProxy get copyWith =>
      _$PasswordSaveStateCWProxyImpl(this);
}
