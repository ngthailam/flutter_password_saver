// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountEntityCWProxy {
  AccountEntity email(String email);

  AccountEntity name(String name);

  AccountEntity password(String password);

  AccountEntity securityQuestionAnswer(String? securityQuestionAnswer);

  AccountEntity securityQuestionId(int? securityQuestionId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountEntity call({
    String? email,
    String? name,
    String? password,
    String? securityQuestionAnswer,
    int? securityQuestionId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountEntity.copyWith.fieldName(...)`
class _$AccountEntityCWProxyImpl implements _$AccountEntityCWProxy {
  final AccountEntity _value;

  const _$AccountEntityCWProxyImpl(this._value);

  @override
  AccountEntity email(String email) => this(email: email);

  @override
  AccountEntity name(String name) => this(name: name);

  @override
  AccountEntity password(String password) => this(password: password);

  @override
  AccountEntity securityQuestionAnswer(String? securityQuestionAnswer) =>
      this(securityQuestionAnswer: securityQuestionAnswer);

  @override
  AccountEntity securityQuestionId(int? securityQuestionId) =>
      this(securityQuestionId: securityQuestionId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountEntity call({
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? securityQuestionAnswer = const $CopyWithPlaceholder(),
    Object? securityQuestionId = const $CopyWithPlaceholder(),
  }) {
    return AccountEntity(
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

extension $AccountEntityCopyWith on AccountEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass AccountEntity extends HiveObject.name.copyWith(...)` or like so:`instanceOfclass AccountEntity extends HiveObject.name.copyWith.fieldName(...)`.
  _$AccountEntityCWProxy get copyWith => _$AccountEntityCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountEntityAdapter extends TypeAdapter<AccountEntity> {
  @override
  final int typeId = 1;

  @override
  AccountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountEntity(
      name: fields[0] as String,
      password: fields[1] as String,
      email: fields[2] as String,
      securityQuestionId: fields[3] as int?,
      securityQuestionAnswer: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountEntity obj) {
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
      other is AccountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
