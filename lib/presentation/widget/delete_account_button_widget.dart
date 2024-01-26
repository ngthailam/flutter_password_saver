import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_alert_dialog.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDeleteAccountDialog(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.red500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.white500,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              'Delete account',
              style: TextStyle(
                  color: AppColors.white500, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showAlertDialog(
      content:
          'Are you sure you want to delet your account? All passwords will be lost forever.',
      context: context,
      defaultActionText: 'Yes',
      cancelActionText: 'No',
      onDefaultAction: onPressed,
    );
  }
}
