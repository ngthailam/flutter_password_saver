import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/loading_indicator.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.isLoading = false,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.height = 48,
    this.fontSize = 16,
    this.width,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final EdgeInsets margin;
  final bool isLoading;
  final double height;
  final double fontSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(32),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: AppColors.blue500,
          ),
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          child: isLoading
              ? const LoadingIndicator(color: AppColors.white500)
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                  ),
                ),
        ),
      ),
    );
  }
}
