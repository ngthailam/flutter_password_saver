import 'package:flutter_password_saver/data/datasource/password_local_data_source.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/data/util/id_generator.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PasswordRepository)
class PasswordRepositoryImpl extends PasswordRepository {
  PasswordRepositoryImpl(this._localDataSource);

  final PasswordLocalDataSource _localDataSource;

  @override
  Future<List<Password>> getAllPasswords() {
    return _localDataSource.getAllPaswords().then((List<PasswordEntity> value) {
      print(value);
      return value.map((e) => e.toModel()).toList();
    });
  }

  @override
  Future<void> savePassword(Password password) {
    final passwordEntity = PasswordEntity.fromPassword(
      password: password,
      newId: generateRandomUuid(),
    );
    return _localDataSource.savePassword(passwordEntity);
  }
}
