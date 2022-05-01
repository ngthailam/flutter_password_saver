
import 'package:copy_with_extension/copy_with_extension.dart';

part 'password.g.dart';

@CopyWith()
class Password {
  Password({
    this.id = '',
    this.name = '',
    this.accName = '',
    this.password = '',
  });

  final String id;
  final String name;
  final String accName;
  final String password;
}
