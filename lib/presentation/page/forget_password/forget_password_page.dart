import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/widget/password_input_page.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_state.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/widget/forget_password_answer_widget.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/widget/forget_password_no_question_widget.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_event.dart';
import 'package:flutter_password_saver/presentation/widget/hot_restart_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController? _codeTextEdtCtrl;
  late ForgetPasswordBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<ForgetPasswordBloc>();
    _codeTextEdtCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _bloc.close();
    _codeTextEdtCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white500,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.black500,
          ),
        ),
      ),
      backgroundColor: AppColors.white500,
      body: BlocProvider(
        create: (context) => _bloc..add(InitializeForgetPasswordEvent()),
        child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context, state) {
            if (state is FpNoQuestionState) {
              if (state.deleteLoadState == LoadState.success) {
                context.showSuccessSnackBar('Account deleted');
                HotRestart.of(context).hotRestart();
              }
            }

            if (state is FpQuestionState) {
              if (state.isAnswerCorrect == false) {
                context.showErrorSnackBar('Answer not correct');
              }
            }

            if (state is FpRenewPassState) {
              if (state.loadState == LoadState.success) {
                context.showSuccessSnackBar('Password changed successfully');
                Navigator.of(context).pop();
              }
            }
          },
          builder: (context, state) {
            if (state is FpQuestionState) {
              return const ForgetPasswordAnswer();
            }

            if (state is FpNoQuestionState) {
              return const ForgetPasswordNoQuestion();
            }

            if (state is FpRenewPassState) {
              return PasswordInputPage(
                userName: state.userName ?? '',
                enableBackBtn: false,
                onConfirm: (password) {
                  _bloc.add(RenewPasswordEvent(password));
                },
                btnMargin:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                btnWidth: MediaQuery.of(context).size.width - 64,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
