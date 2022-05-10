import 'package:flutter_password_saver/domain/model/user.dart';

extension UserExtensions on User {
  String getInitials() {
    return name.isEmpty ? '' : name.trim().split(' ').last[0];
  }
}
