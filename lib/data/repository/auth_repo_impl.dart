import 'package:flutter_password_saver/data/datasource/auth_local_data_source.dart';
import 'package:flutter_password_saver/data/entity/user_entity.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepoitoryImpl extends AuthRepository {
  AuthRepoitoryImpl(this._authLocalDataSource);

  final AuthLocalDataSource _authLocalDataSource;

  @override
  Future<bool> createAccount(User user) {
    return _authLocalDataSource.saveAccount(UserEntity.fromUser(user));
  }

  @override
  Future<User?> getCurrentAccount() {
    return _authLocalDataSource
        .getCurrentUser()
        .then((value) => value?.toModel());
  }

  @override
  Future<bool> login(User user) {
    return _authLocalDataSource.login(user);
  }
}
