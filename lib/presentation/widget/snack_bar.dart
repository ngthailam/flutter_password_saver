import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

enum SnackBarType {
  info,
  success,
  failure,
}

class PrimarySnackBar extends StatelessWidget {
  const PrimarySnackBar({Key? key, required this.message, required this.type})
      : super(key: key);

  final String message;
  final SnackBarType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case SnackBarType.info:
        return _infoSnack();
      case SnackBarType.success:
        return _successSnack();
      case SnackBarType.failure:
        return _failureSnack();
      default:
        throw Exception('Type $type not supported');
    }
  }

  Widget _infoSnack() {
    return _snack(color: AppColors.blue500, iconData: Icons.info);
  }

  Widget _successSnack() {
    return _snack(
        color: AppColors.green500, iconData: Icons.check_circle_outline);
  }

  Widget _failureSnack() {
    return _snack(color: AppColors.red500, iconData: Icons.warning);
  }

  Widget _snack({required Color color, required IconData iconData}) {
    return Material(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 56,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: AppColors.white500,
              ),
              const SizedBox(width: 16),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.white500,
                ),
              ),
            ],
          )),
    );
  }
}
