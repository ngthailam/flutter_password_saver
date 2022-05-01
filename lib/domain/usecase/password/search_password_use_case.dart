import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/repository/password_repo.dart';
import 'package:flutter_password_saver/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchPasswordUseCase extends BaseUseCase<String, List<Password>> {
  SearchPasswordUseCase(this._passwordRepository);

  final PasswordRepository _passwordRepository;

  @override
  Future<List<Password>> execute(String input) {
    return _passwordRepository.searchPassword(input);
  }
}
