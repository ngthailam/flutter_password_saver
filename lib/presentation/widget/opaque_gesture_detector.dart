import 'package:flutter/material.dart';

class OpaqueGestureDetector extends StatelessWidget {
  const OpaqueGestureDetector({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}
