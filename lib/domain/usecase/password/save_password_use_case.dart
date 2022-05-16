import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class SavePasswordUsecase extends BaseUseCase<Password, void> {
  SavePasswordUsecase(this._passwordRepository);

  final PasswordRepository _passwordRepository;

  @override
  Future<void> execute(Password input) {
    return _passwordRepository.savePassword(input);
  }
}
