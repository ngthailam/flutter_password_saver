import 'package:flutter_password_saver/domain/model/user.dart';

abstract class AuthRepository {
  Future<bool> createAccount(User user);

  Future<User?> getCurrentAccount();

  Future<bool> login(User user);
}
