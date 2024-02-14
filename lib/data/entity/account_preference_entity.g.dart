// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_preference_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountPreferenceEntityCWProxy {
  AccountPreferenceEntity items(List<AccountPreferenceItem> items);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceEntity call({
    List<AccountPreferenceItem>? items,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountPreferenceEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountPreferenceEntity.copyWith.fieldName(...)`
class _$AccountPreferenceEntityCWProxyImpl
    implements _$AccountPreferenceEntityCWProxy {
  final AccountPreferenceEntity _value;

  const _$AccountPreferenceEntityCWProxyImpl(this._value);

  @override
  AccountPreferenceEntity items(List<AccountPreferenceItem> items) =>
      this(items: items);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceEntity call({
    Object? items = const $CopyWithPlaceholder(),
  }) {
    return AccountPreferenceEntity(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AccountPreferenceItem>,
    );
  }
}

extension $AccountPreferenceEntityCopyWith on AccountPreferenceEntity {
  /// Returns a callable class that can be used as follows: `instanceOfAccountPreferenceEntity.copyWith(...)` or like so:`instanceOfAccountPreferenceEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountPreferenceEntityCWProxy get copyWith =>
      _$AccountPreferenceEntityCWProxyImpl(this);
}
