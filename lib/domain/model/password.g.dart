// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordCWProxy {
  Password accName(String accName);

  Password id(String id);

  Password name(String name);

  Password password(String password);

  Password settings(List<PasswordSettings> settings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Password(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Password(...).copyWith(id: 12, name: "My name")
  /// ````
  Password call({
    String? accName,
    String? id,
    String? name,
    String? password,
    List<PasswordSettings>? settings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPassword.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPassword.copyWith.fieldName(...)`
class _$PasswordCWProxyImpl implements _$PasswordCWProxy {
  final Password _value;

  const _$PasswordCWProxyImpl(this._value);

  @override
  Password accName(String accName) => this(accName: accName);

  @override
  Password id(String id) => this(id: id);

  @override
  Password name(String name) => this(name: name);

  @override
  Password password(String password) => this(password: password);

  @override
  Password settings(List<PasswordSettings> settings) =>
      this(settings: settings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Password(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Password(...).copyWith(id: 12, name: "My name")
  /// ````
  Password call({
    Object? accName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
  }) {
    return Password(
      accName: accName == const $CopyWithPlaceholder() || accName == null
          ? _value.accName
          // ignore: cast_nullable_to_non_nullable
          : accName as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as List<PasswordSettings>,
    );
  }
}

extension $PasswordCopyWith on Password {
  /// Returns a callable class that can be used as follows: `instanceOfclass Password.name.copyWith(...)` or like so:`instanceOfclass Password.name.copyWith.fieldName(...)`.
  _$PasswordCWProxy get copyWith => _$PasswordCWProxyImpl(this);
}
