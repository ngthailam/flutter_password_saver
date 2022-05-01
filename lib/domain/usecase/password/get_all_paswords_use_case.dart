import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllPasswordsUseCase extends BaseUseCase<void, List<Password>> {
  GetAllPasswordsUseCase(this._passwordRepository);

  final PasswordRepository _passwordRepository;

  @override
  Future<List<Password>> execute(input) {
    return _passwordRepository.getAllPasswords();
  }
}
