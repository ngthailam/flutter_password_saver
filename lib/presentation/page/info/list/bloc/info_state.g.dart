// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InfoStateCWProxy {
  InfoState infos(List<Info> infos);

  InfoState loadState(LoadState loadState);

  InfoState searchKeyword(String searchKeyword);

  InfoState user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  InfoState call({
    List<Info>? infos,
    LoadState? loadState,
    String? searchKeyword,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInfoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInfoState.copyWith.fieldName(...)`
class _$InfoStateCWProxyImpl implements _$InfoStateCWProxy {
  final InfoState _value;

  const _$InfoStateCWProxyImpl(this._value);

  @override
  InfoState infos(List<Info> infos) => this(infos: infos);

  @override
  InfoState loadState(LoadState loadState) => this(loadState: loadState);

  @override
  InfoState searchKeyword(String searchKeyword) =>
      this(searchKeyword: searchKeyword);

  @override
  InfoState user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InfoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InfoState(...).copyWith(id: 12, name: "My name")
  /// ````
  InfoState call({
    Object? infos = const $CopyWithPlaceholder(),
    Object? loadState = const $CopyWithPlaceholder(),
    Object? searchKeyword = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return InfoState(
      infos: infos == const $CopyWithPlaceholder() || infos == null
          ? _value.infos
          // ignore: cast_nullable_to_non_nullable
          : infos as List<Info>,
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      searchKeyword:
          searchKeyword == const $CopyWithPlaceholder() || searchKeyword == null
              ? _value.searchKeyword
              // ignore: cast_nullable_to_non_nullable
              : searchKeyword as String,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $InfoStateCopyWith on InfoState {
  /// Returns a callable class that can be used as follows: `instanceOfInfoState.copyWith(...)` or like so:`instanceOfInfoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InfoStateCWProxy get copyWith => _$InfoStateCWProxyImpl(this);
}
