import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'info.g.dart';

@CopyWith()
class Info extends Equatable {
  const Info({
    required this.id,
    required this.name,
    required this.desc,
    this.createdAt = 0,
  });

  final String id;
  final String name;
  final String desc;
  final int createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        desc,
        createdAt,
      ];
}
