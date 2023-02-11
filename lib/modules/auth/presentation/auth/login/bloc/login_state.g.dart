// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState attemptCount(int attemptCount);

  LoginState canUseBiometrics(bool canUseBiometrics);

  LoginState lockTimeRemaining(int lockTimeRemaining);

  LoginState loginLoadState(LoadState loginLoadState);

  LoginState user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    int? attemptCount,
    bool? canUseBiometrics,
    int? lockTimeRemaining,
    LoadState? loginLoadState,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  final LoginState _value;

  const _$LoginStateCWProxyImpl(this._value);

  @override
  LoginState attemptCount(int attemptCount) => this(attemptCount: attemptCount);

  @override
  LoginState canUseBiometrics(bool canUseBiometrics) =>
      this(canUseBiometrics: canUseBiometrics);

  @override
  LoginState lockTimeRemaining(int lockTimeRemaining) =>
      this(lockTimeRemaining: lockTimeRemaining);

  @override
  LoginState loginLoadState(LoadState loginLoadState) =>
      this(loginLoadState: loginLoadState);

  @override
  LoginState user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? attemptCount = const $CopyWithPlaceholder(),
    Object? canUseBiometrics = const $CopyWithPlaceholder(),
    Object? lockTimeRemaining = const $CopyWithPlaceholder(),
    Object? loginLoadState = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
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
      lockTimeRemaining: lockTimeRemaining == const $CopyWithPlaceholder() ||
              lockTimeRemaining == null
          ? _value.lockTimeRemaining
          // ignore: cast_nullable_to_non_nullable
          : lockTimeRemaining as int,
      loginLoadState: loginLoadState == const $CopyWithPlaceholder() ||
              loginLoadState == null
          ? _value.loginLoadState
          // ignore: cast_nullable_to_non_nullable
          : loginLoadState as LoadState,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
