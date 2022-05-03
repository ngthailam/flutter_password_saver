import 'package:flutter/material.dart';
import 'package:flutter_password_saver/common/type_ext.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/login_page.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/register_page.dart';
import 'package:flutter_password_saver/presentation/page/gateway/gateway_page.dart';
import 'package:flutter_password_saver/presentation/page/intro/intro_page.dart';
import 'package:flutter_password_saver/presentation/page/password/create/password_save_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/password_page.dart';

class AppRouter {
  static const String gateway = 'gateway';
  static const String savePassword = 'password/save';
  static const String password = 'password';
  static const String register = 'register';
  static const String intro = 'intro';
  static const String login = 'login';
  static const String setting = 'settings';

  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case gateway:
        return MaterialPageRoute(
            builder: (context) => const GatewayPage(), settings: settings);
      case password:
        return MaterialPageRoute(
            builder: (context) => const PasswordPage(), settings: settings);
      case savePassword:
        final arg = settings.arguments?.asOrNull<SavePasswordPageArg>();
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PasswordSavePage(arg: arg),
        );
      case register:
        return MaterialPageRoute(
            builder: (context) => const RegisterPage(), settings: settings);
      case intro:
        return MaterialPageRoute(
            builder: (context) => const IntroPage(), settings: settings);
      case login:
        return MaterialPageRoute(
            builder: (context) => const LoginPage(), settings: settings);
      case setting:
        return MaterialPageRoute(
            builder: (context) => Container(), settings: settings);
      default:
        throw Exception('Route not supported');
    }
  }
}
