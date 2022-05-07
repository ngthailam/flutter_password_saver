import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_state.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/util/password_strength_checker.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/util/password_strength_indicator_widget.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/slide_up_widget.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  final RegisterBloc _registerBloc = getIt<RegisterBloc>();

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: maybe change to precache in main
    await precachePicture(
      SvgPicture.asset('assets/svg/login.svg').pictureProvider,
      context,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => _registerBloc,
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) async {
              if (state.loadState == LoadState.success) {
                _animateToNextPage();
                await Future.delayed(const Duration(seconds: 2));
                Navigator.of(context).popAndPushNamed(AppRouter.password);
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                _pages(),
                _indicators(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pages() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48, top: 32),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int pageIdx) {
          setState(() {
            _selectedIndex = pageIdx;
          });
        },
        children: [
          _BenefitPage(onPressed: () => _animateToNextPage()),
          _NameInputPage(onContinue: (name) {
            _animateToNextPage();
            _registerBloc.add(ConfirmNameEvent(name: name));
          }),
          _PasswordInputPage(
            userName: _registerBloc.inputUserName,
            onBackPressed: () => _animateToPrevPage(),
            onConfirm: (password) {
              _registerBloc.add(ConfirmPasswordEvent(password: password));
            },
          ),
          const _CongratulatePage(),
        ],
      ),
    );
  }

  void _animateToNextPage() => _animateToPage(_selectedIndex + 1);
  void _animateToPrevPage() => _animateToPage(_selectedIndex - 1);

  void _animateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _indicators() {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _PageIndicator(isActive: _selectedIndex == 0),
            _PageIndicator(isActive: _selectedIndex == 1),
            _PageIndicator(isActive: _selectedIndex == 2),
            _PageIndicator(isActive: _selectedIndex == 3),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 12 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            _boxShadow,
          ],
          shape: BoxShape.circle,
          color: isActive ? AppColors.blue500 : AppColors.ink300,
        ),
      ),
    );
  }

  BoxShadow get _boxShadow {
    if (isActive) {
      return BoxShadow(
        color: const Color(0XFF2FB7B2).withOpacity(0.72),
        blurRadius: 4.0,
        spreadRadius: 1.0,
        offset: const Offset(0.0, 0.0),
      );
    }

    return const BoxShadow(color: Colors.transparent);
  }
}

class _BenefitPage extends StatefulWidget {
  const _BenefitPage({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  State<_BenefitPage> createState() => _BenefitPageState();
}

class _BenefitPageState extends State<_BenefitPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _content(),
        Positioned(
          bottom: 0,
          child: _continueBtn(context),
        )
      ],
    );
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 32),
          const SlideUp(
            child: Text(
              'Welcome to',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(height: 8),
          const SlideUp(
            delay: Duration(milliseconds: 200),
            child: Text(
              'PASS-SAVER',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: AppColors.blue500),
            ),
          ),
          const SizedBox(height: 32),
          SingleChildScrollView(
            child: _scrollableContent(),
          ),
        ],
      ),
    );
  }

  Widget _scrollableContent() {
    return Column(
      children: [
        _mainImg(),
        const SizedBox(height: 48),
        _benefit1Text(),
        const SizedBox(height: 16),
        _benefit2Text(),
      ],
    );
  }

  Widget _mainImg() {
    return SlideUp(
      delay: const Duration(milliseconds: 1200),
      child: SvgPicture.asset(
        'assets/svg/login.svg',
        height: 180,
        width: 180,
      ),
    );
  }

  Widget _benefit1Text() {
    return SlideUp(
      delay: const Duration(milliseconds: 1400),
      child: RichText(
        text: TextSpan(
          text: 'A place to remember all of your Passwords for you ',
          style: const TextStyle(color: AppColors.black500, fontSize: 14),
          children: [
            const TextSpan(
              text: 'SECURELY',
              style: TextStyle(
                color: AppColors.blue500,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' using your device ${_getDeviceSecureKeyStorage()}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _benefit2Text() {
    return SlideUp(
      delay: const Duration(milliseconds: 1600),
      child: RichText(
        text: const TextSpan(
          text: 'Internet connection is',
          style: TextStyle(color: AppColors.black500, fontSize: 14),
          children: [
            TextSpan(
              text: ' NOT USED',
              style: TextStyle(
                color: AppColors.blue500,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  ' so you can assure that your passwords are not sent anywhere',
            ),
          ],
        ),
      ),
    );
  }

  Widget _continueBtn(BuildContext context) => SlideUp(
        delay: const Duration(milliseconds: 1800),
        child: _Button(
          text: 'Get started',
          onPressed: widget.onPressed,
        ),
      );

  String _getDeviceSecureKeyStorage() {
    return Platform.isAndroid ? 'KeyStore' : 'KeyChain';
  }
}

class _NameInputPage extends StatefulWidget {
  const _NameInputPage({
    Key? key,
    required this.onContinue,
    this.name,
  }) : super(key: key);

  final Function(String name) onContinue;
  final String? name;

  @override
  State<_NameInputPage> createState() => __NameInputPageState();
}

class __NameInputPageState extends State<_NameInputPage> {
  late TextEditingController _textEditingController;

  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.name ?? '');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                const SizedBox(height: 48),
                _inputTextField(),
                const SizedBox(height: 8),
                _errorText(),
              ],
            ),
          ),
        ),
        _continueBtn(),
      ],
    );
  }

  Widget _title() {
    return const SlideUp(
      child: Text(
        'What is your name?',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _inputTextField() {
    return SlideUp(
      delay: const Duration(milliseconds: 200),
      child: TextField(
        cursorColor: AppColors.blue500,
        decoration: const InputDecoration(hintText: 'Enter your name'),
        controller: _textEditingController,
        onChanged: (text) {
          if (_showError) {
            setState(() {
              _showError = false;
            });
          }
        },
      ),
    );
  }

  Widget _errorText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 350),
        opacity: _showError ? 1 : 0,
        child: const Text(
          'User name must not be empty',
          style: TextStyle(color: AppColors.red500),
        ),
      ),
    );
  }

  Widget _continueBtn() {
    return SlideUp(
      delay: const Duration(milliseconds: 400),
      child: _Button(
        onPressed: () {
          if (_textEditingController.text.isEmpty) {
            setState(() {
              _showError = true;
            });
          } else {
            widget.onContinue(_textEditingController.text);
          }
        },
        text: 'Continue',
      ),
    );
  }
}

class _PasswordInputPage extends StatefulWidget {
  const _PasswordInputPage(
      {Key? key,
      required this.onConfirm,
      required this.onBackPressed,
      this.userName = ''})
      : super(key: key);

  final Function(String password) onConfirm;
  final VoidCallback onBackPressed;
  final String userName;

  @override
  State<_PasswordInputPage> createState() => _PasswordInputPageState();
}

class _PasswordInputPageState extends State<_PasswordInputPage> {
  late TextEditingController _passwordTextEdtCtrl;
  late TextEditingController _confirmPasswordTextEdtCtrl;

  bool _showNotMatchedError = false;
  int _passwordStrengthIndex = 0;
  bool _visiblePassword = false;

  final TextStyle _titleStyle = const TextStyle(
    color: AppColors.black500,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _passwordTextEdtCtrl = TextEditingController();
    _confirmPasswordTextEdtCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _passwordTextEdtCtrl.dispose();
    _confirmPasswordTextEdtCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _backButton(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _title(),
                const SizedBox(height: 32),
                _inputPasswordTextField(),
                _confirmPasswordTextField(),
                const SizedBox(height: 8),
                _passStrengthIndicator(),
                const SizedBox(height: 8),
                _errorText(),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
        _confirmBtn(),
      ],
    );
  }

  Widget _backButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: widget.onBackPressed,
        child: const Padding(
            padding: EdgeInsets.all(16), child: Icon(Icons.arrow_back)),
      ),
    );
  }

  Widget _title() {
    return SlideUp(
      child: RichText(
        text: TextSpan(
          text: 'Hi ',
          style: _titleStyle,
          children: [
            TextSpan(
              text: widget.userName,
              style: _titleStyle.copyWith(
                color: AppColors.blue500,
              ),
            ),
            const TextSpan(
              text: ', please choose your password',
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedOpacity(
        opacity: _showNotMatchedError ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: const Text(
          'Passwords do no matched',
          style: TextStyle(color: AppColors.red500),
        ),
      ),
    );
  }

  Widget _inputPasswordTextField() {
    return SlideUp(
      delay: const Duration(milliseconds: 200),
      child: TextField(
        cursorColor: AppColors.blue500,
        decoration: InputDecoration(
          hintText: 'Enter your Password',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _visiblePassword = !_visiblePassword;
              });
            },
            child: Icon(
              _visiblePassword ? Icons.visibility_off : Icons.visibility,
              color: AppColors.blue500,
            ),
          ),
        ),
        controller: _passwordTextEdtCtrl,
        obscureText: !_visiblePassword,
        onChanged: _onPasswordChanged,
      ),
    );
  }

  void _onPasswordChanged(String password) {
    final newStrengthIndex = PasswordStrengthChecker.check(password);
    if (_passwordStrengthIndex != newStrengthIndex || _showNotMatchedError) {
      setState(() {
        _passwordStrengthIndex = newStrengthIndex;
        _showNotMatchedError = false;
      });
    }
  }

  Widget _confirmPasswordTextField() {
    return SlideUp(
      delay: const Duration(milliseconds: 200),
      child: TextField(
        cursorColor: AppColors.blue500,
        decoration: const InputDecoration(hintText: 'Confirm your Password'),
        controller: _confirmPasswordTextEdtCtrl,
        obscureText: !_visiblePassword,
        onChanged: (text) {
          setState(() {
            _showNotMatchedError = false;
          });
        },
      ),
    );
  }

  Widget _confirmBtn() {
    return SlideUp(
      delay: const Duration(milliseconds: 400),
      child: _Button(
        onPressed: () {
          if (_confirmPasswordTextEdtCtrl.text == _passwordTextEdtCtrl.text) {
            widget.onConfirm(_confirmPasswordTextEdtCtrl.text);
          } else {
            setState(() {
              _showNotMatchedError = true;
            });
          }
        },
        text: 'Confirm',
      ),
    );
  }

  Widget _passStrengthIndicator() {
    return SlideUp(
      delay: const Duration(milliseconds: 200),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: PasswordStrengthIndicator(
          strengthIndex: _passwordStrengthIndex,
        ),
      ),
    );
  }
}

class _CongratulatePage extends StatelessWidget {
  const _CongratulatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/register.svg',
          height: 180,
          width: 180,
        ),
        const SizedBox(height: 32),
        const Text(
          'Congratulation,',
          style: TextStyle(
            fontSize: 36,
            color: AppColors.blue500,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'You are all set up!',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      text: text,
      height: 48,
      fontSize: 16,
      width: MediaQuery.of(context).size.width - 96,
      margin: const EdgeInsets.symmetric(horizontal: 48),
    );
  }
}
