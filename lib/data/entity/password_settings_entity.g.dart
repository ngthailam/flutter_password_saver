// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_settings_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordSettingsEntityCWProxy {
  PasswordSettingsEntity name(String name);

  PasswordSettingsEntity passwordId(String passwordId);

  PasswordSettingsEntity value(dynamic value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordSettingsEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordSettingsEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordSettingsEntity call({
    String? name,
    String? passwordId,
    dynamic value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPasswordSettingsEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPasswordSettingsEntity.copyWith.fieldName(...)`
class _$PasswordSettingsEntityCWProxyImpl
    implements _$PasswordSettingsEntityCWProxy {
  final PasswordSettingsEntity _value;

  const _$PasswordSettingsEntityCWProxyImpl(this._value);

  @override
  PasswordSettingsEntity name(String name) => this(name: name);

  @override
  PasswordSettingsEntity passwordId(String passwordId) =>
      this(passwordId: passwordId);

  @override
  PasswordSettingsEntity value(dynamic value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PasswordSettingsEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PasswordSettingsEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PasswordSettingsEntity call({
    Object? name = const $CopyWithPlaceholder(),
    Object? passwordId = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return PasswordSettingsEntity(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
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

extension $PasswordSettingsEntityCopyWith on PasswordSettingsEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass PasswordSettingsEntity extends HiveObject.name.copyWith(...)` or like so:`instanceOfclass PasswordSettingsEntity extends HiveObject.name.copyWith.fieldName(...)`.
  _$PasswordSettingsEntityCWProxy get copyWith =>
      _$PasswordSettingsEntityCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordSettingsEntityAdapter
    extends TypeAdapter<PasswordSettingsEntity> {
  @override
  final int typeId = 2;

  @override
  PasswordSettingsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordSettingsEntity(
      passwordId: fields[0] as String,
      name: fields[1] as String,
      value: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordSettingsEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.passwordId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordSettingsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
