import 'package:flutter/widgets.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/modelext/user_ext.dart';

class AccountIcon extends StatelessWidget {
  const AccountIcon({
    Key? key,
    this.user,
    this.onTap,
    this.size = 32,
  }) : super(key: key);

  final User? user;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blue400,
        ),
        child: Center(
          child: Text(
            user?.getInitials() ?? '',
            style: const TextStyle(color: AppColors.white500),
          ),
        ),
      ),
    );
  }
}
