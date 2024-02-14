import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/opaque_gesture_detector.dart';

Future showAlertDialog({
  required BuildContext context,
  Widget? title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
  VoidCallback? onCancel,
  required VoidCallback onDefaultAction,
}) async {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode() ? AppColors.black500 : AppColors.white500,
        title: title,
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            OpaqueGestureDetector(
              child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(cancelActionText)),
              onTap: () {
                onCancel == null ? Navigator.of(context).pop() : onCancel();
              },
            ),
          TextButton(
            onPressed: onDefaultAction,
            child: Text(defaultActionText),
          ),
        ],
      ),
    );
  }

  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title,
      content: Text(content),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            onPressed: () {
              onCancel == null ? Navigator.of(context).pop() : onCancel();
            },
            textStyle: const TextStyle(color: AppColors.red500),
            child: Text(cancelActionText),
          ),
        CupertinoDialogAction(
          onPressed: onDefaultAction,
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}
