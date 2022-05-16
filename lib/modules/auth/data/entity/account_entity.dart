import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'account_entity.g.dart';

const String accountBox = 'account';

@CopyWith()
@HiveType(typeId: 1)
class AccountEntity extends HiveObject {
  AccountEntity({
    this.name = '',
    this.password = '',
    this.email = '',
    this.securityQuestionId,
    this.securityQuestionAnswer,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final int? securityQuestionId;
  @HiveField(4)
  final String? securityQuestionAnswer;

  @override
  get key => name;

  factory AccountEntity.fromUser(User user) => AccountEntity(
        name: user.name,
        password: user.password,
        email: user.email,
        securityQuestionId: user.securityQuestionId,
        securityQuestionAnswer: user.securityQuestionAnswer,
      );

  User toModel() => User(
        name: name,
        password: password,
        email: email,
        securityQuestionId: securityQuestionId,
        securityQuestionAnswer: securityQuestionAnswer,
      );
}
