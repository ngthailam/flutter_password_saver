// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GatewayStateCWProxy {
  GatewayState destinationRouteName(String? destinationRouteName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GatewayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GatewayState(...).copyWith(id: 12, name: "My name")
  /// ````
  GatewayState call({
    String? destinationRouteName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGatewayState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGatewayState.copyWith.fieldName(...)`
class _$GatewayStateCWProxyImpl implements _$GatewayStateCWProxy {
  final GatewayState _value;

  const _$GatewayStateCWProxyImpl(this._value);

  @override
  GatewayState destinationRouteName(String? destinationRouteName) =>
      this(destinationRouteName: destinationRouteName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GatewayState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GatewayState(...).copyWith(id: 12, name: "My name")
  /// ````
  GatewayState call({
    Object? destinationRouteName = const $CopyWithPlaceholder(),
  }) {
    return GatewayState(
      destinationRouteName: destinationRouteName == const $CopyWithPlaceholder()
          ? _value.destinationRouteName
          // ignore: cast_nullable_to_non_nullable
          : destinationRouteName as String?,
    );
  }
}

extension $GatewayStateCopyWith on GatewayState {
  /// Returns a callable class that can be used as follows: `instanceOfGatewayState.copyWith(...)` or like so:`instanceOfGatewayState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GatewayStateCWProxy get copyWith => _$GatewayStateCWProxyImpl(this);
}
