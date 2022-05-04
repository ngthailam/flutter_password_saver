import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

class PrimaryTextInput extends StatelessWidget {
  const PrimaryTextInput({
    Key? key,
    this.hintText = '',
    this.controller,
    this.onChanged,
    this.icon,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function(String text)? onChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.blue400.withAlpha(40),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          cursorColor: AppColors.blue500,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.blue400),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: AppColors.ink300),
          ),
        ),
      ),
    );
  }
}
