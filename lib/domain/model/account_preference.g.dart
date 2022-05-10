// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_preference.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountPreferenceCWProxy {
  AccountPreference items(List<AccountPreferenceItem> items);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreference(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreference call({
    List<AccountPreferenceItem>? items,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountPreference.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountPreference.copyWith.fieldName(...)`
class _$AccountPreferenceCWProxyImpl implements _$AccountPreferenceCWProxy {
  final AccountPreference _value;

  const _$AccountPreferenceCWProxyImpl(this._value);

  @override
  AccountPreference items(List<AccountPreferenceItem> items) =>
      this(items: items);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreference(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreference call({
    Object? items = const $CopyWithPlaceholder(),
  }) {
    return AccountPreference(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AccountPreferenceItem>,
    );
  }
}

extension $AccountPreferenceCopyWith on AccountPreference {
  /// Returns a callable class that can be used as follows: `instanceOfclass AccountPreference.name.copyWith(...)` or like so:`instanceOfclass AccountPreference.name.copyWith.fieldName(...)`.
  _$AccountPreferenceCWProxy get copyWith =>
      _$AccountPreferenceCWProxyImpl(this);
}

abstract class _$AccountPreferenceItemCWProxy {
  AccountPreferenceItem name(PreferenceName name);

  AccountPreferenceItem value(dynamic value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceItem call({
    PreferenceName? name,
    dynamic value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountPreferenceItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountPreferenceItem.copyWith.fieldName(...)`
class _$AccountPreferenceItemCWProxyImpl
    implements _$AccountPreferenceItemCWProxy {
  final AccountPreferenceItem _value;

  const _$AccountPreferenceItemCWProxyImpl(this._value);

  @override
  AccountPreferenceItem name(PreferenceName name) => this(name: name);

  @override
  AccountPreferenceItem value(dynamic value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceItem call({
    Object? name = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return AccountPreferenceItem(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as PreferenceName,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as dynamic,
    );
  }
}

extension $AccountPreferenceItemCopyWith on AccountPreferenceItem {
  /// Returns a callable class that can be used as follows: `instanceOfclass AccountPreferenceItem.name.copyWith(...)` or like so:`instanceOfclass AccountPreferenceItem.name.copyWith.fieldName(...)`.
  _$AccountPreferenceItemCWProxy get copyWith =>
      _$AccountPreferenceItemCWProxyImpl(this);
}
