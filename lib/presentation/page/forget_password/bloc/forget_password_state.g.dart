// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FpQuestionStateCWProxy {
  FpQuestionState isAnswerCorrect(bool? isAnswerCorrect);

  FpQuestionState loadState(LoadState loadState);

  FpQuestionState question(SecurityQuestion? question);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FpQuestionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FpQuestionState(...).copyWith(id: 12, name: "My name")
  /// ````
  FpQuestionState call({
    bool? isAnswerCorrect,
    LoadState? loadState,
    SecurityQuestion? question,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFpQuestionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFpQuestionState.copyWith.fieldName(...)`
class _$FpQuestionStateCWProxyImpl implements _$FpQuestionStateCWProxy {
  final FpQuestionState _value;

  const _$FpQuestionStateCWProxyImpl(this._value);

  @override
  FpQuestionState isAnswerCorrect(bool? isAnswerCorrect) =>
      this(isAnswerCorrect: isAnswerCorrect);

  @override
  FpQuestionState loadState(LoadState loadState) => this(loadState: loadState);

  @override
  FpQuestionState question(SecurityQuestion? question) =>
      this(question: question);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FpQuestionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FpQuestionState(...).copyWith(id: 12, name: "My name")
  /// ````
  FpQuestionState call({
    Object? isAnswerCorrect = const $CopyWithPlaceholder(),
    Object? loadState = const $CopyWithPlaceholder(),
    Object? question = const $CopyWithPlaceholder(),
  }) {
    return FpQuestionState(
      isAnswerCorrect: isAnswerCorrect == const $CopyWithPlaceholder()
          ? _value.isAnswerCorrect
          // ignore: cast_nullable_to_non_nullable
          : isAnswerCorrect as bool?,
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      question: question == const $CopyWithPlaceholder()
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as SecurityQuestion?,
    );
  }
}

extension $FpQuestionStateCopyWith on FpQuestionState {
  /// Returns a callable class that can be used as follows: `instanceOfFpQuestionState.copyWith(...)` or like so:`instanceOfFpQuestionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FpQuestionStateCWProxy get copyWith => _$FpQuestionStateCWProxyImpl(this);
}

abstract class _$FpNoQuestionStateCWProxy {
  FpNoQuestionState deleteLoadState(LoadState deleteLoadState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FpNoQuestionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FpNoQuestionState(...).copyWith(id: 12, name: "My name")
  /// ````
  FpNoQuestionState call({
    LoadState? deleteLoadState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFpNoQuestionState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFpNoQuestionState.copyWith.fieldName(...)`
class _$FpNoQuestionStateCWProxyImpl implements _$FpNoQuestionStateCWProxy {
  final FpNoQuestionState _value;

  const _$FpNoQuestionStateCWProxyImpl(this._value);

  @override
  FpNoQuestionState deleteLoadState(LoadState deleteLoadState) =>
      this(deleteLoadState: deleteLoadState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FpNoQuestionState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FpNoQuestionState(...).copyWith(id: 12, name: "My name")
  /// ````
  FpNoQuestionState call({
    Object? deleteLoadState = const $CopyWithPlaceholder(),
  }) {
    return FpNoQuestionState(
      deleteLoadState: deleteLoadState == const $CopyWithPlaceholder() ||
              deleteLoadState == null
          ? _value.deleteLoadState
          // ignore: cast_nullable_to_non_nullable
          : deleteLoadState as LoadState,
    );
  }
}

extension $FpNoQuestionStateCopyWith on FpNoQuestionState {
  /// Returns a callable class that can be used as follows: `instanceOfFpNoQuestionState.copyWith(...)` or like so:`instanceOfFpNoQuestionState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FpNoQuestionStateCWProxy get copyWith =>
      _$FpNoQuestionStateCWProxyImpl(this);
}

abstract class _$FpRenewPassStateCWProxy {
  FpRenewPassState loadState(LoadState loadState);

  FpRenewPassState newPassword(String? newPassword);

  FpRenewPassState userName(String? userName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FpRenewPassState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FpRenewPassState(...).copyWith(id: 12, name: "My name")
  /// ````
  FpRenewPassState call({
    LoadState? loadState,
    String? newPassword,
    String? userName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFpRenewPassState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFpRenewPassState.copyWith.fieldName(...)`
class _$FpRenewPassStateCWProxyImpl implements _$FpRenewPassStateCWProxy {
  final FpRenewPassState _value;

  const _$FpRenewPassStateCWProxyImpl(this._value);

  @override
  FpRenewPassState loadState(LoadState loadState) => this(loadState: loadState);

  @override
  FpRenewPassState newPassword(String? newPassword) =>
      this(newPassword: newPassword);

  @override
  FpRenewPassState userName(String? userName) => this(userName: userName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FpRenewPassState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FpRenewPassState(...).copyWith(id: 12, name: "My name")
  /// ````
  FpRenewPassState call({
    Object? loadState = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return FpRenewPassState(
      loadState: loadState == const $CopyWithPlaceholder() || loadState == null
          ? _value.loadState
          // ignore: cast_nullable_to_non_nullable
          : loadState as LoadState,
      newPassword: newPassword == const $CopyWithPlaceholder()
          ? _value.newPassword
          // ignore: cast_nullable_to_non_nullable
          : newPassword as String?,
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
    );
  }
}

extension $FpRenewPassStateCopyWith on FpRenewPassState {
  /// Returns a callable class that can be used as follows: `instanceOfFpRenewPassState.copyWith(...)` or like so:`instanceOfFpRenewPassState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FpRenewPassStateCWProxy get copyWith => _$FpRenewPassStateCWProxyImpl(this);
}
