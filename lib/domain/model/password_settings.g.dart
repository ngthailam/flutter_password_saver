// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordSettingsCWProxy {
  PasswordSettings name(PasswordSettingsName name);

  PasswordSettings passwordId(String passwordId);

  PasswordSettings value(dynamic value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordSettings call({
    PasswordSettingsName? name,
    String? passwordId,
    dynamic? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordSettings.copyWith.fieldName(...)`
class _$PasswordSettingsCWProxyImpl implements _$PasswordSettingsCWProxy {
  final PasswordSettings _value;

  const _$PasswordSettingsCWProxyImpl(this._value);

  @override
  PasswordSettings name(PasswordSettingsName name) => this(name: name);

  @override
  PasswordSettings passwordId(String passwordId) =>
      this(passwordId: passwordId);

  @override
  PasswordSettings value(dynamic value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordSettings call({
    Object? name = const $CopyWithPlaceholder(),
    Object? passwordId = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return PasswordSettings(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as PasswordSettingsName,
      passwordId:
          passwordId == const $CopyWithPlaceholder() || passwordId == null
              ? _value.passwordId
              // ignore: cast_nullable_to_non_nullable
              : passwordId as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as dynamic,
    );
  }
}

extension $PasswordSettingsCopyWith on PasswordSettings {
  /// Returns a callable class that can be used as follows: `instanceOfPasswordSettings.copyWith(...)` or like so:`instanceOfPasswordSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PasswordSettingsCWProxy get copyWith => _$PasswordSettingsCWProxyImpl(this);
}
