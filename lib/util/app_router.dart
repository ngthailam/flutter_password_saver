import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_password_saver/presentation/page/home/home_page.dart';
import 'package:flutter_password_saver/presentation/page/password/create/password_create_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/password_page.dart';

class AppRouter {
  static const home = 'home';
  static const createPassword = 'password/create';
  static const password = 'password';

  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: settings);
      case password:
        return MaterialPageRoute(
            builder: (context) => PasswordPage(), settings: settings);
      case createPassword:
        return MaterialPageRoute(
            builder: (context) => PasswordCreatePage(), settings: settings);
      default:
        throw Exception('Route not supported');
    }
  }
}
