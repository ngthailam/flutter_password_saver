import 'package:flutter_password_saver/data/datasource/password_local_data_source.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/data/util/id_generator.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PasswordRepository)
class PasswordRepositoryImpl extends PasswordRepository {
  PasswordRepositoryImpl(this._localDataSource);

  final PasswordLocalDataSource _localDataSource;

  @override
  Future<List<Password>> getAllPasswords() {
    return _localDataSource.getAllPaswords();
  }

  @override
  Future<void> savePassword(Password password) {
    final passwordEntity = PasswordEntity.fromPassword(
      password: password,
      newId: generateRandomUuid(),
    );
    return _localDataSource.savePassword(passwordEntity);
  }

  @override
  Future<void> deletePassword(String passwordId) {
    return _localDataSource.deletePassword(passwordId);
  }

  @override
  Future<Password> getPasswordById(String passwordId) {
    return _localDataSource.getPasswordById(passwordId);
  }

  @override
  Future<List<Password>> searchPassword(String keyword) {
    return _localDataSource.searchPassword(keyword);
  }

  @override
  Future<void> updateSettings(PasswordSettings settings) {
    return _localDataSource.updateSettings(settings);
  }
}
