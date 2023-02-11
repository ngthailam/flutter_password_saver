import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:hive/hive.dart';

part 'info_entity.g.dart';

const infoEntityBox = 'infos';

@HiveType(typeId: 3)
@CopyWith()
class InfoEntity extends HiveObject {
  InfoEntity({
    required this.id,
    required this.name,
    required this.desc,
    this.createdAt = 0,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String desc;
  @HiveField(3)
  final int? createdAt;

  @override
  get key => id;

  factory InfoEntity.from({
    required Info info,
  }) =>
      InfoEntity(
        id: info.id,
        name: info.name,
        desc: info.desc,
        createdAt: info.createdAt,
      );

  Info toModel() => Info(
        id: id,
        name: name,
        desc: desc,
        createdAt: createdAt ?? 0,
      );
}
