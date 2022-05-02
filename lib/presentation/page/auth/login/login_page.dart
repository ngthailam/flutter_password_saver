import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/util/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = getIt<LoginBloc>();

  late TextEditingController _nameTextEdtCtrl;
  late TextEditingController _passwordTextEdtCtrl;

  @override
  void initState() {
    super.initState();
    _nameTextEdtCtrl = TextEditingController();
    _passwordTextEdtCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextEdtCtrl.dispose();
    _passwordTextEdtCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _loginBloc..add(LoginInitializeEvent()),
        child: BlocListener<LoginBloc, LoginState>(
          listener: ((context, state) {
            if (state.loginLoadState == LoadState.success) {
              Navigator.of(context).popAndPushNamed(AppRouter.home);
            } else if (state.loginLoadState == LoadState.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Username or password incorect')));
            }

            if (state.user != null && _nameTextEdtCtrl.text.isEmpty) {
              _nameTextEdtCtrl.text = state.user?.name ?? '';
            }
          }),
          child: Column(
            children: [
              TextField(
                controller: _nameTextEdtCtrl,
                onChanged: _loginBloc.onNameChanged,
              ),
              TextField(
                controller: _passwordTextEdtCtrl,
                onChanged: _loginBloc.onPasswordChanged,
              ),
              _loginBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return TextButton(
        onPressed: () {
          _loginBloc.add(ConfirmLoginEvent());
        },
        child: const Text('Login'));
  }
}
