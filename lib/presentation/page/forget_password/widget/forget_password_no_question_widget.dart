import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/delete_account_button_widget.dart';
import 'package:flutter_password_saver/presentation/widget/notice_widget.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_event.dart';

class ForgetPasswordNoQuestion extends StatelessWidget {
  const ForgetPasswordNoQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Notice(
            text: 'You did not set up a security question when you register your account.' +
                'You can choose to delete current account (all passwords will be deleted)',
            backgroundColor: AppColors.orange500,
          ),
          const SizedBox(height: 16),
          DeleteAccountButton(onPressed: () {
            context.read<ForgetPasswordBloc>().add(DeleteAccountEvent());
          }),
        ],
      ),
    );
  }
}
