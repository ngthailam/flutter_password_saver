import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/widget/primary_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension SnackbarExtension on BuildContext {
  void showToast(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(message),
      ),
    );
  }

  void showSnackBar(String message, SnackBarType type) {
    showTopSnackBar(
      this,
      PrimarySnackBar(message: message, type: type),
      showOutAnimationDuration: const Duration(milliseconds: 1000),
      hideOutAnimationDuration: const Duration(milliseconds: 200),
      displayDuration: const Duration(milliseconds: 1500),
      leftPadding: 16,
      rightPadding: 16,
      additionalTopPadding: 0,
    );
  }

  void showErrorSnackBar(String message) =>
      showSnackBar(message, SnackBarType.failure);

  void showSuccessSnackBar(String message) =>
      showSnackBar(message, SnackBarType.success);

  void showInfoSnackBar(String message) =>
      showSnackBar(message, SnackBarType.info);
}
