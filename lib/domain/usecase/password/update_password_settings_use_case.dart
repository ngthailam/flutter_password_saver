import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePasswordSettingsUseCase
    extends BaseUseCase<PasswordSettings, void> {
  UpdatePasswordSettingsUseCase(this._passwordRepository);

  final PasswordRepository _passwordRepository;

  @override
  Future<void> execute(PasswordSettings input) {
    return _passwordRepository.updateSettings(input);
  }
}
