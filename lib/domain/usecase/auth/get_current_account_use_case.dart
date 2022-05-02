import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/domain/repository/auth_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentAccountUseCase extends BaseUseCase<void, User?> {
  GetCurrentAccountUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<User?> execute(void input) {
    return _authRepository.getCurrentAccount();
  }
}
