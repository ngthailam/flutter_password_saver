import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@CopyWith()
class User extends Equatable {
  const User(
      {this.name = '',
      this.password = '',
      this.email = '',
      this.securityQuestionId,
      this.securityQuestionAnswer});

  final String name;
  final String password;
  final String email;
  final int? securityQuestionId;
  final String? securityQuestionAnswer;

  @override
  List<Object?> get props => [
        name,
        password,
        email,
        securityQuestionId,
        securityQuestionAnswer,
      ];
}
