import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/util/app_router.dart';

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _registerBloc,
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.loadState == LoadState.success) {
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
    );
  }

  Widget _pages() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int pageIdx) {
        setState(() {
          _selectedIndex = pageIdx;
        });
      },
      children: [
        _NameInputPage(onContinue: (name) {
          _pageController.animateToPage(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
          _registerBloc.add(ConfirmNameEvent(name: name));
        }),
        _PasswordInputPage(onConfirm: (password) {
          _registerBloc.add(ConfirmPasswordEvent(password: password));
          // Call bloc save user
        }),
      ],
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
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            _boxShadow,
          ],
          shape: BoxShape.circle,
          color: isActive ? const Color(0XFF6BC4C9) : const Color(0XFFEAEAEA),
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

class _NameInputPage extends StatefulWidget {
  const _NameInputPage({Key? key, required this.onContinue}) : super(key: key);

  final Function(String name) onContinue;

  @override
  State<_NameInputPage> createState() => __NameInputPageState();
}

class __NameInputPageState extends State<_NameInputPage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _inputTextField(),
        _continueBtn(),
      ],
    );
  }

  Widget _inputTextField() {
    return TextField(
      controller: _textEditingController,
    );
  }

  Widget _continueBtn() {
    return TextButton(
      onPressed: () {
        widget.onContinue(_textEditingController.text);
      },
      child: const Text('Continue'),
    );
  }
}

class _PasswordInputPage extends StatefulWidget {
  const _PasswordInputPage({Key? key, required this.onConfirm})
      : super(key: key);

  final Function(String password) onConfirm;

  @override
  State<_PasswordInputPage> createState() => _PasswordInputPageState();
}

class _PasswordInputPageState extends State<_PasswordInputPage> {
  late TextEditingController _passwordTextEdtCtrl;
  late TextEditingController _confirmPasswordTextEdtCtrl;
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
        _inputPasswordTextField(),
        _confirmPasswordTextField(),
        _confirmBtn(),
      ],
    );
  }

  Widget _inputPasswordTextField() {
    return TextField(
      controller: _passwordTextEdtCtrl,
    );
  }

  Widget _confirmPasswordTextField() {
    return TextField(
      controller: _confirmPasswordTextEdtCtrl,
    );
  }

  Widget _confirmBtn() {
    return TextButton(
      onPressed: () {
        if (_confirmPasswordTextEdtCtrl.text == _passwordTextEdtCtrl.text) {
          widget.onConfirm(_confirmPasswordTextEdtCtrl.text);
        } else {
          // Handle show passwords not matched
        }
      },
      child: const Text('Confirm'),
    );
  }
}
