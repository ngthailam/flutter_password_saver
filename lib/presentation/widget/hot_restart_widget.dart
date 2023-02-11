import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_password_saver/main.dart';

class HotRestart extends StatefulWidget {
  final Widget child;

  const HotRestart({Key? key, required this.child}) : super(key: key);

  static of(BuildContext context) {
    return context.findAncestorStateOfType<_HotRestartState>()!;
  }

  @override
  State<HotRestart> createState() => _HotRestartState();
}

class _HotRestartState extends State<HotRestart> {
  Key key = UniqueKey();

  void hotRestart() {
    MyApp.resetDefaultTheme();
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
