// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_preference_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountPreferenceEntityCWProxy {
  AccountPreferenceEntity alwaysShowPasswords(bool alwaysShowPasswords);

  AccountPreferenceEntity enableDarkMode(bool enableDarkMode);

  AccountPreferenceEntity languageCode(String languageCode);

  AccountPreferenceEntity requireLogin(bool requireLogin);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceEntity call({
    bool? alwaysShowPasswords,
    bool? enableDarkMode,
    String? languageCode,
    bool? requireLogin,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountPreferenceEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountPreferenceEntity.copyWith.fieldName(...)`
class _$AccountPreferenceEntityCWProxyImpl
    implements _$AccountPreferenceEntityCWProxy {
  final AccountPreferenceEntity _value;

  const _$AccountPreferenceEntityCWProxyImpl(this._value);

  @override
  AccountPreferenceEntity alwaysShowPasswords(bool alwaysShowPasswords) =>
      this(alwaysShowPasswords: alwaysShowPasswords);

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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountPreferenceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountPreferenceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountPreferenceEntity call({
    Object? alwaysShowPasswords = const $CopyWithPlaceholder(),
    Object? enableDarkMode = const $CopyWithPlaceholder(),
    Object? languageCode = const $CopyWithPlaceholder(),
    Object? requireLogin = const $CopyWithPlaceholder(),
  }) {
    return AccountPreferenceEntity(
      alwaysShowPasswords:
          alwaysShowPasswords == const $CopyWithPlaceholder() ||
                  alwaysShowPasswords == null
              ? _value.alwaysShowPasswords
              // ignore: cast_nullable_to_non_nullable
              : alwaysShowPasswords as bool,
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
    );
  }
}

extension $AccountPreferenceEntityCopyWith on AccountPreferenceEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass AccountPreferenceEntity.name.copyWith(...)` or like so:`instanceOfclass AccountPreferenceEntity.name.copyWith.fieldName(...)`.
  _$AccountPreferenceEntityCWProxy get copyWith =>
      _$AccountPreferenceEntityCWProxyImpl(this);
}
