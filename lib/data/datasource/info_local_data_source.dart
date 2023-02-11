import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/data/entity/info_entity.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class InfoLocalDataSource {
  Future<List<Info>> getAll();

  Future<void> save(Info info);

  Future<void> deleteById(String infoId);

  Future<Info?> getById(String infoId);
}

@Injectable(as: InfoLocalDataSource)
class InfoLocalDataSourceImpl extends InfoLocalDataSource {
  InfoLocalDataSourceImpl(
    this._secureStorage,
  );

  final SecureStorage _secureStorage;

  Future<Box<InfoEntity>> _getInfoBox() async {
    final encryptionKey = await _secureStorage.getDbEncryptionKey();
    return Hive.openBox(
      infoEntityBox,
      encryptionCipher: HiveAesCipher(encryptionKey!),
    );
  }

  @override
  Future<void> deleteById(String infoId) async {
    final box = await _getInfoBox();
    try {
      await box.delete(infoId);
      return;
    } catch (e) {
      return Future.error(e);
    } finally {
      await box.close();
    }
  }

  @override
  Future<List<Info>> getAll() async {
    final box = await _getInfoBox();
    try {
      final List<Info> result =
          box.values.cast<InfoEntity>().map((e) => e.toModel()).toList();
      return result;
    } catch (e) {
      return [];
    } finally {
      await box.close();
    }
  }

  @override
  Future<Info?> getById(String infoId) async {
    final box = await _getInfoBox();
    try {
      final InfoEntity result = box.get(infoId)!;
      return result.toModel();
    } catch (e) {
      return null;
    } finally {
      await box.close();
    }
  }

  @override
  Future<void> save(Info info) async {
    final box = await _getInfoBox();
    try {
      final entity = InfoEntity.from(info: info);
      await box.put(entity.key, entity);
      return;
    } catch (e) {
      // Handle errors here
      return Future.error(e);
    } finally {
      await box.close();
    }
  }
}
