import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';

// ignore: must_be_immutable
class PasswordStrengthIndicator extends StatelessWidget {
  PasswordStrengthIndicator({
    Key? key,
    required this.strengthIndex,
  }) : super(key: key);

  final int strengthIndex;
  Color _defaultColor = AppColors.ink200;
  Color _color = AppColors.ink200;

  @override
  Widget build(BuildContext context) {
    _defaultColor = isDarkMode() ? AppColors.white200 : AppColors.ink200;
    _color = _defaultColor;
    _color = _resolveColor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _strengthIndicator(),
        const SizedBox(width: 16),
        _strengthText(),
      ],
    );
  }

  Widget _strengthIndicator() {
    final List<Widget> bars = [];

    for (int i = 0; i < 4; i++) {
      bars
        ..add(_bar(hasColor: i < strengthIndex))
        ..add(const SizedBox(width: 4));
    }
    return Row(
      children: bars,
    );
  }

  Widget _strengthText() {
    return Text(
      _resolveText(),
      style: TextStyle(color: _color),
    );
  }

  String _resolveText() {
    switch (strengthIndex) {
      case 1:
        return 'Weak';
      case 2:
        return 'Medium';
      case 3:
        return 'Strong';
      case 4:
        return 'Excellent';
      default:
        return '';
    }
  }

  Color _resolveColor() {
    switch (strengthIndex) {
      case 1:
        return AppColors.red500;
      case 2:
        return AppColors.orange500;
      case 3:
        return AppColors.green500;
      case 4:
        return AppColors.blue500;
      default:
        return _defaultColor;
    }
  }

  Widget _bar({required bool hasColor}) {
    return Container(
      height: 8,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: hasColor ? _color : _defaultColor,
      ),
    );
  }
}
