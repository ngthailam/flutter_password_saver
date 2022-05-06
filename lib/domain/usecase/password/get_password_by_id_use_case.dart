import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPasswordByIdUseCase extends BaseUseCase<String, Password?> {
  GetPasswordByIdUseCase(this._passwordRepository);

  final PasswordRepository _passwordRepository;

  @override
  Future<Password?> execute(String input) {
    return _passwordRepository.getPasswordById(input);
  }
}
