// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_create_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordCreateStateCWProxy {
  PasswordCreateState loadState(LoadState loadState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordCreateState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordCreateState(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordCreateState call({
    LoadState? loadState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordCreateState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordCreateState.copyWith.fieldName(...)`
class _$PasswordCreateStateCWProxyImpl implements _$PasswordCreateStateCWProxy {
  final PasswordCreateState _value;

  const _$PasswordCreateStateCWProxyImpl(this._value);

  @override
  PasswordCreateState loadState(LoadState loadState) =>
      this(loadState: loadState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordCreateState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordCreateState(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordCreateState call({
    Object? loadState = const $CopyWithPlaceholder(),
  }) {
    return PasswordCreateState(
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
    );
  }
}

extension $PasswordCreateStateCopyWith on PasswordCreateState {
  /// Returns a callable class that can be used as follows: `instanceOfclass PasswordCreateState.name.copyWith(...)` or like so:`instanceOfclass PasswordCreateState.name.copyWith.fieldName(...)`.
  _$PasswordCreateStateCWProxy get copyWith =>
      _$PasswordCreateStateCWProxyImpl(this);
}
