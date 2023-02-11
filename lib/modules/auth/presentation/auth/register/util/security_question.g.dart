// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SecurityQuestionCWProxy {
  SecurityQuestion answer(String answer);

  SecurityQuestion id(int id);

  SecurityQuestion question(String question);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SecurityQuestion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SecurityQuestion(...).copyWith(id: 12, name: "My name")
  /// ````
  SecurityQuestion call({
    String? answer,
    int? id,
    String? question,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSecurityQuestion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSecurityQuestion.copyWith.fieldName(...)`
class _$SecurityQuestionCWProxyImpl implements _$SecurityQuestionCWProxy {
  final SecurityQuestion _value;

  const _$SecurityQuestionCWProxyImpl(this._value);

  @override
  SecurityQuestion answer(String answer) => this(answer: answer);

  @override
  SecurityQuestion id(int id) => this(id: id);

  @override
  SecurityQuestion question(String question) => this(question: question);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SecurityQuestion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SecurityQuestion(...).copyWith(id: 12, name: "My name")
  /// ````
  SecurityQuestion call({
    Object? answer = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? question = const $CopyWithPlaceholder(),
  }) {
    return SecurityQuestion(
      answer: answer == const $CopyWithPlaceholder() || answer == null
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      question: question == const $CopyWithPlaceholder() || question == null
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as String,
    );
  }
}

extension $SecurityQuestionCopyWith on SecurityQuestion {
  /// Returns a callable class that can be used as follows: `instanceOfSecurityQuestion.copyWith(...)` or like so:`instanceOfSecurityQuestion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SecurityQuestionCWProxy get copyWith => _$SecurityQuestionCWProxyImpl(this);
}
