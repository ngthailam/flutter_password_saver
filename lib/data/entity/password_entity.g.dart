// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordEntityCWProxy {
  PasswordEntity accName(String accName);

  PasswordEntity createdAt(int? createdAt);

  PasswordEntity id(String id);

  PasswordEntity name(String name);

  PasswordEntity order(int? order);

  PasswordEntity password(String password);

  PasswordEntity settings(HiveList<PasswordSettingsEntity>? settings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordEntity call({
    String? accName,
    int? createdAt,
    String? id,
    String? name,
    int? order,
    String? password,
    HiveList<PasswordSettingsEntity>? settings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordEntity.copyWith.fieldName(...)`
class _$PasswordEntityCWProxyImpl implements _$PasswordEntityCWProxy {
  final PasswordEntity _value;

  const _$PasswordEntityCWProxyImpl(this._value);

  @override
  PasswordEntity accName(String accName) => this(accName: accName);

  @override
  PasswordEntity createdAt(int? createdAt) => this(createdAt: createdAt);

  @override
  PasswordEntity id(String id) => this(id: id);

  @override
  PasswordEntity name(String name) => this(name: name);

  @override
  PasswordEntity order(int? order) => this(order: order);

  @override
  PasswordEntity password(String password) => this(password: password);

  @override
  PasswordEntity settings(HiveList<PasswordSettingsEntity>? settings) =>
      this(settings: settings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordEntity call({
    Object? accName = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
  }) {
    return PasswordEntity(
      accName: accName == const $CopyWithPlaceholder() || accName == null
          ? _value.accName
          // ignore: cast_nullable_to_non_nullable
          : accName as String,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as int?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      order: order == const $CopyWithPlaceholder()
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as int?,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      settings: settings == const $CopyWithPlaceholder()
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as HiveList<PasswordSettingsEntity>?,
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
      settings: (fields[4] as HiveList?)?.castHiveList(),
      order: fields[5] as int?,
      createdAt: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.accName)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.settings)
      ..writeByte(5)
      ..write(obj.order)
      ..writeByte(6)
      ..write(obj.createdAt);
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
