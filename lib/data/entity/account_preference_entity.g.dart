// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_preference_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountPreferenceEntityCWProxy {
  AccountPreferenceEntity allowSearchAccName(bool allowSearchAccName);

  AccountPreferenceEntity enableDarkMode(bool enableDarkMode);

  AccountPreferenceEntity languageCode(String languageCode);

  AccountPreferenceEntity requireLogin(bool requireLogin);

  AccountPreferenceEntity showAccName(bool showAccName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceEntity call({
    bool? allowSearchAccName,
    bool? enableDarkMode,
    String? languageCode,
    bool? requireLogin,
    bool? showAccName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountPreferenceEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountPreferenceEntity.copyWith.fieldName(...)`
class _$AccountPreferenceEntityCWProxyImpl
    implements _$AccountPreferenceEntityCWProxy {
  final AccountPreferenceEntity _value;

  const _$AccountPreferenceEntityCWProxyImpl(this._value);

  @override
  AccountPreferenceEntity allowSearchAccName(bool allowSearchAccName) =>
      this(allowSearchAccName: allowSearchAccName);

  @override
  AccountPreferenceEntity enableDarkMode(bool enableDarkMode) =>
      this(enableDarkMode: enableDarkMode);

  @override
  AccountPreferenceEntity languageCode(String languageCode) =>
      this(languageCode: languageCode);

  @override
  AccountPreferenceEntity requireLogin(bool requireLogin) =>
      this(requireLogin: requireLogin);

  @override
  AccountPreferenceEntity showAccName(bool showAccName) =>
      this(showAccName: showAccName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceEntity call({
    Object? allowSearchAccName = const $CopyWithPlaceholder(),
    Object? enableDarkMode = const $CopyWithPlaceholder(),
    Object? languageCode = const $CopyWithPlaceholder(),
    Object? requireLogin = const $CopyWithPlaceholder(),
    Object? showAccName = const $CopyWithPlaceholder(),
  }) {
    return AccountPreferenceEntity(
      allowSearchAccName: allowSearchAccName == const $CopyWithPlaceholder() ||
              allowSearchAccName == null
          ? _value.allowSearchAccName
          // ignore: cast_nullable_to_non_nullable
          : allowSearchAccName as bool,
      enableDarkMode: enableDarkMode == const $CopyWithPlaceholder() ||
              enableDarkMode == null
          ? _value.enableDarkMode
          // ignore: cast_nullable_to_non_nullable
          : enableDarkMode as bool,
      languageCode:
          languageCode == const $CopyWithPlaceholder() || languageCode == null
              ? _value.languageCode
              // ignore: cast_nullable_to_non_nullable
              : languageCode as String,
      requireLogin:
          requireLogin == const $CopyWithPlaceholder() || requireLogin == null
              ? _value.requireLogin
              // ignore: cast_nullable_to_non_nullable
              : requireLogin as bool,
      showAccName:
          showAccName == const $CopyWithPlaceholder() || showAccName == null
              ? _value.showAccName
              // ignore: cast_nullable_to_non_nullable
              : showAccName as bool,
    );
  }
}

extension $AccountPreferenceEntityCopyWith on AccountPreferenceEntity {
  /// Returns a callable class that can be used as follows: `instanceOfAccountPreferenceEntity.copyWith(...)` or like so:`instanceOfAccountPreferenceEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountPreferenceEntityCWProxy get copyWith =>
      _$AccountPreferenceEntityCWProxyImpl(this);
}
