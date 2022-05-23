import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:super_tooltip/super_tooltip.dart';

mixin PasswordPageTooltipMixin {
  SuperTooltip? _fabTooltip;
  SuperTooltip? _avatarTooltip;
  BuildContext? fabContext;
  BuildContext? avatarContext;

  void showTooltips() {
    _setAndShowTooltip(fabContext!, onClosed: () {
      _showAvatarTooltip();
    });
  }

  void _showAvatarTooltip() {
    RenderBox box = avatarContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(const Offset(16, 16));

    _avatarTooltip = SuperTooltip(
      popupDirection: TooltipDirection.left,
      arrowTipDistance: 24,
      hasShadow: false,
      backgroundColor: AppColors.blue500,
      borderWidth: 1,
      touchThrougArea: Rect.fromCircle(center: position, radius: 24.0),
      borderColor: AppColors.blue500,
      outsideBackgroundColor: AppColors.ink400,
      content: const Material(
        color: AppColors.blue500,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Press avatar to open settings',
            softWrap: true,
            style: TextStyle(color: AppColors.white500),
          ),
        ),
      ),
    );

    _avatarTooltip!.show(avatarContext!);
  }

  void _setAndShowTooltip(BuildContext ctx, {VoidCallback? onClosed}) {
    if (_fabTooltip?.isOpen == true) {
      _fabTooltip?.close();
    }

    RenderBox box = ctx.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(const Offset(28, 28));

    _fabTooltip = SuperTooltip(
      popupDirection: TooltipDirection.left,
      arrowTipDistance: 32,
      hasShadow: false,
      onClose: onClosed,
      backgroundColor: AppColors.blue500,
      borderWidth: 1,
      touchThrougArea: Rect.fromCircle(center: position, radius: 38.0),
      borderColor: AppColors.blue500,
      outsideBackgroundColor: AppColors.ink400,
      content: const Material(
        color: AppColors.blue500,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Press here to save your first password',
            softWrap: true,
            style: TextStyle(color: AppColors.white500),
          ),
        ),
      ),
    );

    _fabTooltip!.show(ctx);
  }
}
