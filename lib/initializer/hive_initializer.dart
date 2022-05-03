import 'dart:convert';

import 'package:flutter_password_saver/data/datasource/secure_storage.dart';
import 'package:flutter_password_saver/data/entity/password_entity.dart';
import 'package:flutter_password_saver/data/entity/password_settings_entity.dart';
import 'package:flutter_password_saver/data/entity/user_entity.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  final secureStorage = getIt<SecureStorage>();
  // if key not exists return null
  final encryprionKey = await secureStorage.getDbEncryptionKey();
  if (encryprionKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.saveDbEncryptionKey(base64UrlEncode(key));
  }

  Hive
    ..registerAdapter(PasswordEntityAdapter())
    ..registerAdapter(PasswordSettingsEntityAdapter())
    ..registerAdapter(UserEntityAdapter());
}
