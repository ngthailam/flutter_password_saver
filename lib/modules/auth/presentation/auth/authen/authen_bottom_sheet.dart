import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/authen/bloc/authen_bloc.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/authen/bloc/authen_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/utils/time_util.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/primary_text_input.dart';

Future<bool?> showAuthenBottomSheet(
  BuildContext context, {
  bool isDismissible = false,
  String? authenReason,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return Wrap(
        children: [
          AuthenBottomSheet(
            authenReason: authenReason,
          )
        ],
      );
    },
  );
}

class AuthenBottomSheet extends StatefulWidget {
  const AuthenBottomSheet({Key? key, this.authenReason}) : super(key: key);

  final String? authenReason;

  @override
  State<AuthenBottomSheet> createState() => _AuthenBottomSheetState();
}

class _AuthenBottomSheetState extends State<AuthenBottomSheet> {
  AuthenCubit? _authenCubit;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _authenCubit = getIt<AuthenCubit>()..initialize();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _authenCubit = null;
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          padding: MediaQuery.of(context).viewInsets,
          child: BlocProvider(
            create: (context) => _authenCubit!,
            child: BlocListener<AuthenCubit, AuthenState>(
              listener: (context, state) {
                if (state.loadState == LoadState.success) {
                  Navigator.of(context).pop(true);
                }

                if (state.loadState == LoadState.failure) {
                  if (state.lockTimeRemaining == 0) {
                    context.showErrorSnackBar(S().errorPassIncorrect);
                  } else {
                    context.showErrorSnackBar(
                      S().sbLoginErrorAttempt(
                        millisToReadableTime(state.lockTimeRemaining),
                      ),
                    );
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _title(),
                    const SizedBox(height: 8),
                    const Divider(color: AppColors.ink200),
                    _authenReason(),
                    const SizedBox(height: 8),
                    _passwordInput(),
                    const SizedBox(height: 24),
                    _button(),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _authenReason() {
    if (widget.authenReason?.isNotEmpty == true) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Text(widget.authenReason!),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _title() => const Text(
        'Authenticate',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );

  Widget _passwordInput() {
    return PrimaryTextInput(
      controller: _textEditingController,
      hintText: 'Your login password',
      icon: Icons.lock,
    );
  }

  Widget _button() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PrimaryButton(
            text: 'Confirm',
            onPressed: () {
              _authenCubit?.authenByPassword(_textEditingController.text);
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            _authenCubit?.authenByBio();
          },
          child: const Icon(
            Icons.fingerprint,
            size: 48,
            color: AppColors.blue500,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
