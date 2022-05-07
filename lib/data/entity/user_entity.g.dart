// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserEntityCWProxy {
  UserEntity email(String email);

  UserEntity name(String name);

  UserEntity password(String password);

  UserEntity securityQuestionAnswer(String? securityQuestionAnswer);

  UserEntity securityQuestionId(int? securityQuestionId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserEntity call({
    String? email,
    String? name,
    String? password,
    String? securityQuestionAnswer,
    int? securityQuestionId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserEntity.copyWith.fieldName(...)`
class _$UserEntityCWProxyImpl implements _$UserEntityCWProxy {
  final UserEntity _value;

  const _$UserEntityCWProxyImpl(this._value);

  @override
  UserEntity email(String email) => this(email: email);

  @override
  UserEntity name(String name) => this(name: name);

  @override
  UserEntity password(String password) => this(password: password);

  @override
  UserEntity securityQuestionAnswer(String? securityQuestionAnswer) =>
      this(securityQuestionAnswer: securityQuestionAnswer);

  @override
  UserEntity securityQuestionId(int? securityQuestionId) =>
      this(securityQuestionId: securityQuestionId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserEntity call({
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? securityQuestionAnswer = const $CopyWithPlaceholder(),
    Object? securityQuestionId = const $CopyWithPlaceholder(),
  }) {
    return UserEntity(
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

extension $UserEntityCopyWith on UserEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass UserEntity extends HiveObject.name.copyWith(...)` or like so:`instanceOfclass UserEntity extends HiveObject.name.copyWith.fieldName(...)`.
  _$UserEntityCWProxy get copyWith => _$UserEntityCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      name: fields[0] as String,
      password: fields[1] as String,
      email: fields[2] as String,
      securityQuestionId: fields[3] as int?,
      securityQuestionAnswer: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.securityQuestionId)
      ..writeByte(4)
      ..write(obj.securityQuestionAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
