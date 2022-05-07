// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PreferenceStateCWProxy {
  PreferenceState deleteLoadState(LoadState deleteLoadState);

  PreferenceState loadState(LoadState loadState);

  PreferenceState preference(AccountPreference? preference);

  PreferenceState user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreferenceState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreferenceState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreferenceState call({
    LoadState? deleteLoadState,
    LoadState? loadState,
    AccountPreference? preference,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPreferenceState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPreferenceState.copyWith.fieldName(...)`
class _$PreferenceStateCWProxyImpl implements _$PreferenceStateCWProxy {
  final PreferenceState _value;

  const _$PreferenceStateCWProxyImpl(this._value);

  @override
  PreferenceState deleteLoadState(LoadState deleteLoadState) =>
      this(deleteLoadState: deleteLoadState);

  @override
  PreferenceState loadState(LoadState loadState) => this(loadState: loadState);

  @override
  PreferenceState preference(AccountPreference? preference) =>
      this(preference: preference);

  @override
  PreferenceState user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreferenceState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreferenceState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreferenceState call({
    Object? deleteLoadState = const $CopyWithPlaceholder(),
    Object? loadState = const $CopyWithPlaceholder(),
    Object? preference = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return PreferenceState(
      deleteLoadState: deleteLoadState == const $CopyWithPlaceholder() ||
              deleteLoadState == null
          ? _value.deleteLoadState
          // ignore: cast_nullable_to_non_nullable
          : deleteLoadState as LoadState,
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      preference: preference == const $CopyWithPlaceholder()
          ? _value.preference
          // ignore: cast_nullable_to_non_nullable
          : preference as AccountPreference?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $PreferenceStateCopyWith on PreferenceState {
  /// Returns a callable class that can be used as follows: `instanceOfclass PreferenceState.name.copyWith(...)` or like so:`instanceOfclass PreferenceState.name.copyWith.fieldName(...)`.
  _$PreferenceStateCWProxy get copyWith => _$PreferenceStateCWProxyImpl(this);
}
