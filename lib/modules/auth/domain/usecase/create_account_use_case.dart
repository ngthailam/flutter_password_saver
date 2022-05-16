import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/modules/auth/domain/repo/auth_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateAccountUseCase extends BaseUseCase<User, bool> {
  CreateAccountUseCase(this._authRepoitory);

  final AuthRepository _authRepoitory;

  @override
  Future<bool> execute(User input) {
    return _authRepoitory.createAccount(input);
  }
}
