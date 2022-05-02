// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GatewayStateCWProxy {
  GatewayState userStatus(UserStatus? userStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GatewayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GatewayState(...).copyWith(id: 12, name: "My name")
  /// ````
  GatewayState call({
    UserStatus? userStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGatewayState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGatewayState.copyWith.fieldName(...)`
class _$GatewayStateCWProxyImpl implements _$GatewayStateCWProxy {
  final GatewayState _value;

  const _$GatewayStateCWProxyImpl(this._value);

  @override
  GatewayState userStatus(UserStatus? userStatus) =>
      this(userStatus: userStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GatewayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GatewayState(...).copyWith(id: 12, name: "My name")
  /// ````
  GatewayState call({
    Object? userStatus = const $CopyWithPlaceholder(),
  }) {
    return GatewayState(
      userStatus: userStatus == const $CopyWithPlaceholder()
          ? _value.userStatus
          // ignore: cast_nullable_to_non_nullable
          : userStatus as UserStatus?,
    );
  }
}

extension $GatewayStateCopyWith on GatewayState {
  /// Returns a callable class that can be used as follows: `instanceOfclass GatewayState.name.copyWith(...)` or like so:`instanceOfclass GatewayState.name.copyWith.fieldName(...)`.
  _$GatewayStateCWProxy get copyWith => _$GatewayStateCWProxyImpl(this);
}
