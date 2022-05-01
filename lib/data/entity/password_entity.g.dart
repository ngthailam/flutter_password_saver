// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordEntityCWProxy {
  PasswordEntity accName(String accName);

  PasswordEntity id(String id);

  PasswordEntity name(String name);

  PasswordEntity password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordEntity call({
    String? accName,
    String? id,
    String? name,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordEntity.copyWith.fieldName(...)`
class _$PasswordEntityCWProxyImpl implements _$PasswordEntityCWProxy {
  final PasswordEntity _value;

  const _$PasswordEntityCWProxyImpl(this._value);

  @override
  PasswordEntity accName(String accName) => this(accName: accName);

  @override
  PasswordEntity id(String id) => this(id: id);

  @override
  PasswordEntity name(String name) => this(name: name);

  @override
  PasswordEntity password(String password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordEntity call({
    Object? accName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return PasswordEntity(
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
    );
  }
}

extension $PasswordEntityCopyWith on PasswordEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass PasswordEntity extends HiveObject.name.copyWith(...)` or like so:`instanceOfclass PasswordEntity extends HiveObject.name.copyWith.fieldName(...)`.
  _$PasswordEntityCWProxy get copyWith => _$PasswordEntityCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordEntityAdapter extends TypeAdapter<PasswordEntity> {
  @override
  final int typeId = 0;

  @override
  PasswordEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      accName: fields[2] as String,
      password: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.accName)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
