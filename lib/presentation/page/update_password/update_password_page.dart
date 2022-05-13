import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/widget/password_input_page.dart';
import 'package:flutter_password_saver/presentation/page/update_password/bloc/update_password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/update_password/bloc/update_password_event.dart';
import 'package:flutter_password_saver/presentation/page/update_password/bloc/update_password_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  late UpdatePasswordBloc _bloc;

  @override
  void initState() {
    _bloc = getIt<UpdatePasswordBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _bloc,
          child: BlocConsumer<UpdatePasswordBloc, UpdatePasswordState>(
            listener: (context, state) {
              if (state.savePasswordLoadState == LoadState.success) {
                context.showSuccessSnackBar(S().sbUpdateAccPassSuccess);
                Navigator.of(context).pop();
                return;
              }
            },
            builder: (context, state) {
              return PasswordInputPage(
                userName: state.user?.name ?? '',
                onBackPressed: () => Navigator.of(context).pop(),
                onConfirm: (String password) {
                  _bloc.add(ConfirmNewPasswordEvent(password: password));
                },
                btnWidth: MediaQuery.of(context).size.width - 64,
              );
            },
          ),
        ),
      ),
    );
  }
}
