// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InfoEntityCWProxy {
  InfoEntity createdAt(int? createdAt);

  InfoEntity desc(String desc);

  InfoEntity id(String id);

  InfoEntity name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InfoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InfoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  InfoEntity call({
    int? createdAt,
    String? desc,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInfoEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInfoEntity.copyWith.fieldName(...)`
class _$InfoEntityCWProxyImpl implements _$InfoEntityCWProxy {
  final InfoEntity _value;

  const _$InfoEntityCWProxyImpl(this._value);

  @override
  InfoEntity createdAt(int? createdAt) => this(createdAt: createdAt);

  @override
  InfoEntity desc(String desc) => this(desc: desc);

  @override
  InfoEntity id(String id) => this(id: id);

  @override
  InfoEntity name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InfoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InfoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  InfoEntity call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? desc = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return InfoEntity(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as int?,
      desc: desc == const $CopyWithPlaceholder() || desc == null
          ? _value.desc
          // ignore: cast_nullable_to_non_nullable
          : desc as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $InfoEntityCopyWith on InfoEntity {
  /// Returns a callable class that can be used as follows: `instanceOfInfoEntity.copyWith(...)` or like so:`instanceOfInfoEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InfoEntityCWProxy get copyWith => _$InfoEntityCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoEntityAdapter extends TypeAdapter<InfoEntity> {
  @override
  final int typeId = 3;

  @override
  InfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      desc: fields[2] as String,
      createdAt: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, InfoEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
