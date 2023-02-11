import 'package:flutter_password_saver/data/datasource/info_local_data_source.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/domain/repository/info_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InfoRepository)
class InfoRepositoryImpl extends InfoRepository {
  final InfoLocalDataSource _infoLocalDataSource;

  InfoRepositoryImpl(this._infoLocalDataSource);

  @override
  Future<void> deleteById(String infoId) {
    return _infoLocalDataSource.deleteById(infoId);
  }

  @override
  Future<List<Info>> getAll() {
    return _infoLocalDataSource.getAll();
  }

  @override
  Future<Info?> getById(String infoId) {
    return _infoLocalDataSource.getById(infoId);
  }

  @override
  Future<void> save(Info info) {
    return _infoLocalDataSource.save(info);
  }

  @override
  Future<List<Info>> search(String keyword) {
    return _infoLocalDataSource.getAll().then((value) => value.where(
          (element) {
            final matchName = element.name.toLowerCase().contains(keyword);
            return matchName;
          },
        ).toList());
  }
}
