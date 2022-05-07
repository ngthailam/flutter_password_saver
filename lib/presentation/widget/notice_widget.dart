import 'package:flutter/widgets.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

class Notice extends StatelessWidget {
  const Notice({
    Key? key,
    this.onPressed,
    required this.backgroundColor,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.white500),
        ),
      ),
    );
  }
}
