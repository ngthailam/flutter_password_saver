import 'package:copy_with_extension/copy_with_extension.dart';

part 'user.g.dart';

@CopyWith()
class User {
  User({
    this.name = '',
    this.password = '',
  });

  final String name;
  final String password;

  @override
  String toString() {
    return '[User] name=$name, password=$password';
  }
}
