import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/util/theme_util.dart';

class IconInkWell extends StatelessWidget {
  const IconInkWell({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final widget = InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: icon,
      ),
    );

    return Platform.isAndroid
        ? Material(
            color: isDarkMode() ? AppColors.blue500 : AppColors.white500,
            child: widget,
          )
        : widget;
  }
}
