import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeletePasswordUseCase extends BaseUseCase<String, void> {
  DeletePasswordUseCase(this._passwordRepository);

  final PasswordRepository _passwordRepository;

  @override
  Future<void> execute(String input) {
    return _passwordRepository.deletePassword(input);
  }
}
