import 'package:flutter_password_saver/domain/repository/info_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteInfoUseCase extends BaseUseCase<String, void> {
  DeleteInfoUseCase(this._infoRepository);

  final InfoRepository _infoRepository;

  @override
  Future<void> execute(String input) {
    return _infoRepository.deleteById(input);
  }
}
