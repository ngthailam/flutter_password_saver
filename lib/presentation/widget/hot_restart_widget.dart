import 'package:flutter/widgets.dart';

class HotRestart extends StatefulWidget {
  final Widget child;

  const HotRestart({Key? key, required this.child}) : super(key: key);

  static _HotRestartState of(BuildContext context) {
    return context.findAncestorStateOfType<_HotRestartState>()!;
  }

  @override
  _HotRestartState createState() => _HotRestartState();
}

class _HotRestartState extends State<HotRestart> {
  Key key = UniqueKey();

  void hotRestart() {
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
