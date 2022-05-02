import 'package:flutter/material.dart';
import 'package:flutter_password_saver/util/app_router.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _appName(),
        _introContent(),
        _beginBtn(),
      ],
    );
  }

  Widget _appName() {
    return const Text('Password Saver');
  }

  Widget _introContent() {
    return const Text('What does password saver do?');
  }

  Widget _beginBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.register);
          },
          child: const Text('Continue')),
    );
  }
}
