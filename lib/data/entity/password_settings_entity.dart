import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:hive/hive.dart';

part 'password_settings_entity.g.dart';

const passwordSettingsBox = 'passwordSettings';

@CopyWith()
@HiveType(typeId: 2)
class PasswordSettingsEntity extends HiveObject {
  PasswordSettingsEntity({
    this.passwordId = '',
    required this.name,
    this.value,
  });

  @HiveField(0)
  final String passwordId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final dynamic value;

  @override
  get key => '$passwordId-$name';

  @override
  String toString() {
    return '[PasswordSettingsEntity]name=$name, value=$value';
  }

  factory PasswordSettingsEntity.fromPasswordSettings(
          PasswordSettings settings) =>
      PasswordSettingsEntity(
        passwordId: settings.passwordId,
        name: settings.name.name,
        value: settings.value,
      );

  PasswordSettings toModel() => PasswordSettings(
        passwordId: passwordId,
        name: PasswordSettingsName.values.byName(name),
        value: value,
      );
}
