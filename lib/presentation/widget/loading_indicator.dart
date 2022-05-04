import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, this.size = 32, this.color})
      : super(key: key);

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: Platform.isAndroid ? _androidIndicator() : _iosIndicator(),
      ),
    );
  }

  _androidIndicator() {
    return CircularProgressIndicator(color: color);
  }

  _iosIndicator() {
    return CupertinoActivityIndicator(color: color);
  }
}
