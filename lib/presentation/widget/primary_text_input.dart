import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/util/theme_util.dart';

class PrimaryTextInput extends StatelessWidget {
  const PrimaryTextInput({
    Key? key,
    this.hintText = '',
    this.controller,
    this.onChanged,
    this.icon,
    this.obscureText = false,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.textInputAction,
    this.onSubmitted,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function(String text)? onChanged;
  final IconData? icon;
  final bool obscureText;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.blue400.withAlpha(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2), // to make text more centralized
        child: TextField(
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          cursorColor: AppColors.blue500,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.blue400),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: isDarkMode() ? AppColors.white300 : AppColors.ink300,
            ),
          ),
        ),
      ),
    );
  }
}
