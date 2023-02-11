import 'package:flutter_password_saver/domain/model/info.dart';

abstract class InfoRepository {
  Future<List<Info>> getAll();

  Future<void> save(Info info);

  Future<void> deleteById(String infoId);

  Future<Info?> getById(String infoId);

  Future<List<Info>> search(String keyword);
}
