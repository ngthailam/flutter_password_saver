import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/data/entity/password_settings_entity.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:hive/hive.dart';

part 'password_entity.g.dart';

const passwordEntityBox = 'passwords';

@HiveType(typeId: 0)
@CopyWith()
class PasswordEntity extends HiveObject {
  PasswordEntity({
    required this.id,
    this.name = '',
    this.accName = '',
    this.password = '',
    this.settings,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String accName;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final HiveList<PasswordSettingsEntity>? settings;

  @override
  get key => id;

  @override
  String toString() {
    return '[PasswordEntity] id=$id, name=$name, accName=$accName, password=$password';
  }

  factory PasswordEntity.fromPassword({
    required Password password,
    HiveList<PasswordSettingsEntity>? settings,
  }) =>
      PasswordEntity(
        id: password.id,
        name: password.name,
        accName: password.accName,
        password: password.password,
        settings: settings,
      );

  Password toModel(List<PasswordSettings> settings) => Password(
        id: id,
        name: name,
        accName: accName,
        password: password,
        settings: settings
                
      );
}
