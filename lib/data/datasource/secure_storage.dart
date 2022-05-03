import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SecureStorage {
  Future<Uint8List?> getDbEncryptionKey();

  Future<void> saveDbEncryptionKey(String keyStr);
}

@Singleton(as: SecureStorage)
class SecureStorageImpl extends SecureStorage {
  static const dbKey = 'key';
  // To improve a tiny bit of performance
  Uint8List? _dbEncryptionKey;

  @override
  Future<Uint8List?> getDbEncryptionKey() async {
    if (_dbEncryptionKey != null) {
      return _dbEncryptionKey;
    }

    const secureStorage = FlutterSecureStorage();
    final keyStr = await secureStorage.read(key: dbKey);
    if (keyStr == null) return null;
    final key = base64Url.decode(keyStr);
    _dbEncryptionKey = key;
    return _dbEncryptionKey;
  }

  @override
  Future<void> saveDbEncryptionKey(String keyStr) {
    const secureStorage = FlutterSecureStorage();

    return secureStorage.write(key: dbKey, value: keyStr);
  }
}
