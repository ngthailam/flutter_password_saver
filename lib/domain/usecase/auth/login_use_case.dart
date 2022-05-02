import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends BaseUseCase<User, bool> {
  LoginUseCase(this._authRepoitory);

  final AuthRepository _authRepoitory;

  @override
  Future<bool> execute(User input) {
    return _authRepoitory.login(input);
  }
}
