// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordStateCWProxy {
  PasswordState loadState(LoadState loadState);

  PasswordState passwords(List<Password> passwords);

  PasswordState searchKeyword(String searchKeyword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordState call({
    LoadState? loadState,
    List<Password>? passwords,
    String? searchKeyword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordState.copyWith.fieldName(...)`
class _$PasswordStateCWProxyImpl implements _$PasswordStateCWProxy {
  final PasswordState _value;

  const _$PasswordStateCWProxyImpl(this._value);

  @override
  PasswordState loadState(LoadState loadState) => this(loadState: loadState);

  @override
  PasswordState passwords(List<Password> passwords) =>
      this(passwords: passwords);

  @override
  PasswordState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordState(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordState call({
    Object? loadState = const $CopyWithPlaceholder(),
    Object? passwords = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
  }) {
    return PasswordState(
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      passwords: passwords == const $CopyWithPlaceholder() || passwords == null
          ? _value.passwords
          // ignore: cast_nullable_to_non_nullable
          : passwords as List<Password>,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
    );
  }
}

extension $PasswordStateCopyWith on PasswordState {
  /// Returns a callable class that can be used as follows: `instanceOfclass PasswordState.name.copyWith(...)` or like so:`instanceOfclass PasswordState.name.copyWith.fieldName(...)`.
  _$PasswordStateCWProxy get copyWith => _$PasswordStateCWProxyImpl(this);
}
