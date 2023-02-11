import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/login/bloc/login_bloc.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/login/bloc/login_event.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/login/bloc/login_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/utils/time_util.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/primary_text_input.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
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
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: ((context, state) {
              if (state.loginLoadState == LoadState.success) {
                _onLoginSuccess(context);
              } else if (state.loginLoadState == LoadState.failure) {
                if (state.lockTimeRemaining == 0) {
                  context.showErrorSnackBar(S().sbLoginError);
                } else {
                  context.showErrorSnackBar(
                    S().sbLoginErrorAttempt(
                        millisToReadableTime(state.lockTimeRemaining)),
                  );
                }
              }

              if (state.user != null && _nameTextEdtCtrl.text.isEmpty) {
                final userName = state.user!.name;
                _nameTextEdtCtrl.text = userName;
                _loginBloc.onNameChanged(userName);
              }
            }),
            builder: (context, state) {
              return Stack(
                children: [
                  _rightCenterBubble(),
                  _topLeftBubble(),
                  _body(),
                ],
              );
            },
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 86),
          child: ListView(
            children: [
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  S().welcomeBack,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(height: 24),
              _mainImage(),
              const SizedBox(height: 16),
              _nameTextField(),
              _passwordTextField(),
              const SizedBox(height: 8),
              _biometricsIcon(),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _loginBtn(),
                  const SizedBox(height: 12),
                  _forgotPasswordPrompt(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _mainImage() {
    return SvgPicture.asset(
      'assets/svg/login.svg',
      width: MediaQuery.of(context).size.width / 1.5,
    );
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
      textInputAction: TextInputAction.done,
      onSubmitted: (value) => _loginBloc.add(ConfirmLoginEvent()),
    );
  }

  Widget _biometricsIcon() {
    final enable = _loginBloc.state.canUseBiometrics;
    if (!enable) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () {
        _loginBloc.add(LoginBiometricsEvent());
      },
      child: const Icon(
        Icons.fingerprint,
        size: 48,
        color: AppColors.blue500,
      ),
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

  void _onLoginSuccess(BuildContext context) async {
    Navigator.of(context).popAndPushNamed(AppRouter.initialRoute);
  }
}
