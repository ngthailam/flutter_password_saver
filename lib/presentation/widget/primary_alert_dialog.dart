import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

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
        title: title,
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () {
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
