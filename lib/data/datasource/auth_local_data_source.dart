import 'package:flutter_password_saver/data/entity/user_entity.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveAccount(UserEntity user);

  Future<UserEntity?> getCurrentUser();

  Future<bool> login(User user);
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<UserEntity?> getCurrentUser() async {
    final box = await Hive.openBox(userBox);
    try {
      final user = await box.values.cast().first as UserEntity;
      return user;
    } catch (e) {
      return null;
    } finally {
      await box.close();
    }
  }

  @override
  Future<bool> saveAccount(UserEntity user) async {
    final box = await Hive.openBox(userBox);
    try {
      await box.put(user.name, user);
      return true;
    } catch (e) {
      return false;
    } finally {
      await box.close();
    }
  }

  @override
  Future<bool> login(User user) async {
    final currentUser = await getCurrentUser();
    if (currentUser == null) return false;
    if (user.name == currentUser.name &&
        user.password == currentUser.password) {
      return true;
    }
    return false;
  }
}
