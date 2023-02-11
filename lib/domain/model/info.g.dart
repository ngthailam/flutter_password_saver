// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InfoCWProxy {
  Info createdAt(int createdAt);

  Info desc(String desc);

  Info id(String id);

  Info name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Info(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Info(...).copyWith(id: 12, name: "My name")
  /// ````
  Info call({
    int? createdAt,
    String? desc,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInfo.copyWith.fieldName(...)`
class _$InfoCWProxyImpl implements _$InfoCWProxy {
  final Info _value;

  const _$InfoCWProxyImpl(this._value);

  @override
  Info createdAt(int createdAt) => this(createdAt: createdAt);

  @override
  Info desc(String desc) => this(desc: desc);

  @override
  Info id(String id) => this(id: id);

  @override
  Info name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Info(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Info(...).copyWith(id: 12, name: "My name")
  /// ````
  Info call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? desc = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Info(
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as int,
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

extension $InfoCopyWith on Info {
  /// Returns a callable class that can be used as follows: `instanceOfInfo.copyWith(...)` or like so:`instanceOfInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InfoCWProxy get copyWith => _$InfoCWProxyImpl(this);
}
