// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authen_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthenStateCWProxy {
  AuthenState attemptCount(int attemptCount);

  AuthenState canUseBiometrics(bool canUseBiometrics);

  AuthenState loadState(LoadState loadState);

  AuthenState lockTimeRemaining(int lockTimeRemaining);

  AuthenState user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthenState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthenState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthenState call({
    int? attemptCount,
    bool? canUseBiometrics,
    LoadState? loadState,
    int? lockTimeRemaining,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthenState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthenState.copyWith.fieldName(...)`
class _$AuthenStateCWProxyImpl implements _$AuthenStateCWProxy {
  final AuthenState _value;

  const _$AuthenStateCWProxyImpl(this._value);

  @override
  AuthenState attemptCount(int attemptCount) =>
      this(attemptCount: attemptCount);

  @override
  AuthenState canUseBiometrics(bool canUseBiometrics) =>
      this(canUseBiometrics: canUseBiometrics);

  @override
  AuthenState loadState(LoadState loadState) => this(loadState: loadState);

  @override
  AuthenState lockTimeRemaining(int lockTimeRemaining) =>
      this(lockTimeRemaining: lockTimeRemaining);

  @override
  AuthenState user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthenState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthenState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthenState call({
    Object? attemptCount = const $CopyWithPlaceholder(),
    Object? canUseBiometrics = const $CopyWithPlaceholder(),
    Object? loadState = const $CopyWithPlaceholder(),
    Object? lockTimeRemaining = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return AuthenState(
      attemptCount:
          attemptCount == const $CopyWithPlaceholder() || attemptCount == null
              ? _value.attemptCount
              // ignore: cast_nullable_to_non_nullable
              : attemptCount as int,
      canUseBiometrics: canUseBiometrics == const $CopyWithPlaceholder() ||
              canUseBiometrics == null
          ? _value.canUseBiometrics
          // ignore: cast_nullable_to_non_nullable
          : canUseBiometrics as bool,
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      lockTimeRemaining: lockTimeRemaining == const $CopyWithPlaceholder() ||
              lockTimeRemaining == null
          ? _value.lockTimeRemaining
          // ignore: cast_nullable_to_non_nullable
          : lockTimeRemaining as int,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $AuthenStateCopyWith on AuthenState {
  /// Returns a callable class that can be used as follows: `instanceOfclass AuthenState.name.copyWith(...)` or like so:`instanceOfclass AuthenState.name.copyWith.fieldName(...)`.
  _$AuthenStateCWProxy get copyWith => _$AuthenStateCWProxyImpl(this);
}
