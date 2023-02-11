// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User email(String email);

  User name(String name);

  User password(String password);

  User securityQuestionAnswer(String? securityQuestionAnswer);

  User securityQuestionId(int? securityQuestionId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    String? email,
    String? name,
    String? password,
    String? securityQuestionAnswer,
    int? securityQuestionId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User email(String email) => this(email: email);

  @override
  User name(String name) => this(name: name);

  @override
  User password(String password) => this(password: password);

  @override
  User securityQuestionAnswer(String? securityQuestionAnswer) =>
      this(securityQuestionAnswer: securityQuestionAnswer);

  @override
  User securityQuestionId(int? securityQuestionId) =>
      this(securityQuestionId: securityQuestionId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? securityQuestionAnswer = const $CopyWithPlaceholder(),
    Object? securityQuestionId = const $CopyWithPlaceholder(),
  }) {
    return User(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      securityQuestionAnswer:
          securityQuestionAnswer == const $CopyWithPlaceholder()
              ? _value.securityQuestionAnswer
              // ignore: cast_nullable_to_non_nullable
              : securityQuestionAnswer as String?,
      securityQuestionId: securityQuestionId == const $CopyWithPlaceholder()
          ? _value.securityQuestionId
          // ignore: cast_nullable_to_non_nullable
          : securityQuestionId as int?,
    );
  }
}

extension $UserCopyWith on User {
  /// Returns a callable class that can be used as follows: `instanceOfUser.copyWith(...)` or like so:`instanceOfUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserCWProxy get copyWith => _$UserCWProxyImpl(this);
}
