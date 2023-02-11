// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_info_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SaveInfoStateCWProxy {
  SaveInfoState info(Info? info);

  SaveInfoState loadState(LoadState loadState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaveInfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaveInfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaveInfoState call({
    Info? info,
    LoadState? loadState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSaveInfoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSaveInfoState.copyWith.fieldName(...)`
class _$SaveInfoStateCWProxyImpl implements _$SaveInfoStateCWProxy {
  final SaveInfoState _value;

  const _$SaveInfoStateCWProxyImpl(this._value);

  @override
  SaveInfoState info(Info? info) => this(info: info);

  @override
  SaveInfoState loadState(LoadState loadState) => this(loadState: loadState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SaveInfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SaveInfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  SaveInfoState call({
    Object? info = const $CopyWithPlaceholder(),
    Object? loadState = const $CopyWithPlaceholder(),
  }) {
    return SaveInfoState(
      info: info == const $CopyWithPlaceholder()
          ? _value.info
          // ignore: cast_nullable_to_non_nullable
          : info as Info?,
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
    );
  }
}

extension $SaveInfoStateCopyWith on SaveInfoState {
  /// Returns a callable class that can be used as follows: `instanceOfSaveInfoState.copyWith(...)` or like so:`instanceOfSaveInfoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SaveInfoStateCWProxy get copyWith => _$SaveInfoStateCWProxyImpl(this);
}
