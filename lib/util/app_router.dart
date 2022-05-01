import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_password_saver/common/type_ext.dart';
import 'package:flutter_password_saver/presentation/page/home/home_page.dart';
import 'package:flutter_password_saver/presentation/page/password/create/password_save_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/password_page.dart';

class AppRouter {
  static const home = 'home';
  static const savePassword = 'password/save';
  static const password = 'password';

  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: settings);
      case password:
        return MaterialPageRoute(
            builder: (context) => PasswordPage(), settings: settings);
      case savePassword:
        final arg = settings.arguments?.asOrNull<SavePasswordPageArg>();
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PasswordSavePage(arg: arg),
        );
      default:
        throw Exception('Route not supported');
    }
  }
}
