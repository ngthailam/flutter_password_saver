import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/login/bloc/login_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/utils/time_util.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/primary_text_input.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => _loginBloc..add(LoginInitializeEvent()),
          child: BlocListener<LoginBloc, LoginState>(
            listener: ((context, state) {
              if (state.loginLoadState == LoadState.success) {
                Navigator.of(context).popAndPushNamed(AppRouter.password);
              } else if (state.loginLoadState == LoadState.failure) {
                if (state.lockTimeRemaining == 0) {
                  context.showErrorSnackBar('Username or password incorect');
                } else {
                  context.showErrorSnackBar(
                      'Too many attempts, try again in ${millisToReadableTime(state.lockTimeRemaining)}');
                }
              }

              if (state.user != null && _nameTextEdtCtrl.text.isEmpty) {
                final userName = state.user!.name;
                _nameTextEdtCtrl.text = userName;
                _loginBloc.onNameChanged(userName);
              }
            }),
            child: Stack(
              children: [
                _rightCenterBubble(),
                _topLeftBubble(),
                _body(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rightCenterBubble() {
    return Positioned(
      top: 100,
      right: -50,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.blue400,
        ),
      ),
    );
  }

  Widget _topLeftBubble() {
    return Positioned(
      top: -50,
      left: -50,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.blue400,
        ),
      ),
    );
  }

  Widget _body() {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 350),
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 32),
            _mainIcon(),
            const SizedBox(height: 16),
            _nameTextField(),
            _passwordTextField(),
            const SizedBox(height: 32),
            _loginBtn(),
            const SizedBox(height: 12),
            _forgotPasswordPrompt(),
          ],
        )),
      ),
    );
  }

  Widget _mainIcon() {
    return SvgPicture.asset('assets/svg/login.svg');
  }

  Widget _nameTextField() {
    return PrimaryTextInput(
      icon: Icons.group,
      hintText: 'Your name',
      controller: _nameTextEdtCtrl,
      onChanged: _loginBloc.onNameChanged,
    );
  }

  Widget _passwordTextField() {
    return PrimaryTextInput(
      icon: Icons.lock,
      hintText: 'Your password',
      controller: _passwordTextEdtCtrl,
      onChanged: _loginBloc.onPasswordChanged,
      obscureText: true,
    );
  }

  Widget _loginBtn() {
    return PrimaryButton(
      onPressed: () {
        _loginBloc.add(ConfirmLoginEvent());
      },
      text: 'Login',
    );
  }

  Widget _forgotPasswordPrompt() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouter.forgetPassword);
      },
      child: const Text(
        'I dont remember my password',
        style: TextStyle(
          color: AppColors.blue400,
          fontSize: 14,
        ),
      ),
    );
  }
}
