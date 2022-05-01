import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class PasswordLocalDataSource {
  Future<List<PasswordEntity>> getAllPaswords();

  Future<void> savePassword(PasswordEntity password);
}

@Injectable(as: PasswordLocalDataSource)
class PasswordLocalDataSourceImpl extends PasswordLocalDataSource {
  @override
  Future<List<PasswordEntity>> getAllPaswords() async {
    var box = await Hive.openBox(passwordEntityBox);
    try {
      final passwords =
          box.values.cast().map((e) => e as PasswordEntity).toList();
      return passwords;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<void> savePassword(PasswordEntity password) async {
    var box = await Hive.openBox(passwordEntityBox);
    try {
      await box.put(password.key, password);
      return;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }
}
