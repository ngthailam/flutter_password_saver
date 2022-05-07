import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_entity.g.dart';

const String userBox = 'user';

@CopyWith()
@HiveType(typeId: 1)
class UserEntity extends HiveObject {
  UserEntity({
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

  factory UserEntity.fromUser(User user) => UserEntity(
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
