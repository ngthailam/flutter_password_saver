import 'dart:async';
import 'package:flutter/material.dart';

class SlideUp extends StatefulWidget {
  const SlideUp(
      {Key? key,
      required this.child,
      this.delay = Duration.zero,
      this.slideDuration = const Duration(seconds: 1)})
      : super(key: key);

  final Widget child;
  final Duration delay;
  final Duration slideDuration;

  @override
  _SlideUpState createState() => _SlideUpState();
}

class _SlideUpState extends State<SlideUp> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: widget.slideDuration);
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(curve);

    if (widget.delay.inMilliseconds == 0) {
      _animController?.forward();
    } else {
      Timer(widget.delay, () {
        _animController?.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_animOffset == null || _animController == null) return widget.child;
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset!,
        child: widget.child,
      ),
      opacity: _animController!,
    );
  }
}
