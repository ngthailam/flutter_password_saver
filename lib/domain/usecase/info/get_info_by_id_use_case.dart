import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/domain/repository/info_repo.dart';
import 'package:flutter_password_saver/common/base/base_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInfoByIdUseCase extends BaseUseCase<String, Info?> {
  GetInfoByIdUseCase(this._infoRepository);

  final InfoRepository _infoRepository;

  @override
  Future<Info?> execute(String input) {
    return _infoRepository.getById(input);
  }
}
