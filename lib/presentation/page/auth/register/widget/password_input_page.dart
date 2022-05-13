import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/util/password_strength_checker.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/util/password_strength_indicator_widget.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/slide_up_widget.dart';
import 'package:flutter_password_saver/util/theme_util.dart';

class PasswordInputPage extends StatefulWidget {
  const PasswordInputPage({
    Key? key,
    required this.onConfirm,
    this.onBackPressed,
    this.enableBackBtn = true,
    this.userName = '',
    this.btnWidth,
    this.btnMargin = const EdgeInsets.symmetric(horizontal: 16),
  }) : super(key: key);

  final Function(String password) onConfirm;
  final VoidCallback? onBackPressed;
  final String userName;
  final bool enableBackBtn;
  final double? btnWidth;
  final EdgeInsets btnMargin;

  @override
  State<PasswordInputPage> createState() => _PasswordInputPageState();
}

class _PasswordInputPageState extends State<PasswordInputPage> {
  late TextEditingController _passwordTextEdtCtrl;
  late TextEditingController _confirmPasswordTextEdtCtrl;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  bool _isDarkMode = false;

  bool _showNotMatchedError = false;
  int _passwordStrengthIndex = 0;
  bool _visiblePassword = false;

  @override
  void initState() {
    super.initState();
    _passwordTextEdtCtrl = TextEditingController();
    _confirmPasswordTextEdtCtrl = TextEditingController();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _isDarkMode = isDarkMode();
  }

  @override
  void didUpdateWidget(covariant PasswordInputPage oldWidget) {
    _isDarkMode = isDarkMode();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _passwordTextEdtCtrl.dispose();
    _confirmPasswordTextEdtCtrl.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backButton(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              _title(),
              const SizedBox(height: 32),
              _inputPasswordTextField(),
              _confirmPasswordTextField(),
              const SizedBox(height: 8),
              _passStrengthIndicator(),
              const SizedBox(height: 8),
              _errorText(),
            ],
          ),
        ),
        _confirmBtn(),
      ],
    );
  }

  Widget _backButton() {
    if (!widget.enableBackBtn) return const SizedBox.shrink();
    return Positioned(
      top: 0,
      left: 0,
      child: GestureDetector(
        onTap: () {
          _unfocusAll();
          widget.onBackPressed?.call();
        },
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
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _isDarkMode ? AppColors.white500 : AppColors.black500,
          ),
          children: [
            TextSpan(
              text: widget.userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
      onComplete: _passwordFocusNode.requestFocus,
      delay: const Duration(milliseconds: 200),
      child: TextField(
        onSubmitted: (text) => _confirmPasswordFocusNode.requestFocus(),
        focusNode: _passwordFocusNode,
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
        onSubmitted: (text) => _onConfirm(),
        focusNode: _confirmPasswordFocusNode,
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
    return Positioned(
      bottom: 0,
      child: SlideUp(
        delay: const Duration(milliseconds: 400),
        child: PrimaryButton(
          onPressed: _onConfirm,
          text: 'Confirm',
          margin: widget.btnMargin,
          width: widget.btnWidth,
        ),
      ),
    );
  }

  void _onConfirm() {
    _unfocusAll();
    if (_confirmPasswordTextEdtCtrl.text == _passwordTextEdtCtrl.text) {
      widget.onConfirm(_confirmPasswordTextEdtCtrl.text);
    } else {
      setState(() {
        _showNotMatchedError = true;
      });
    }
  }

  void _unfocusAll() {
    _passwordFocusNode.unfocus();
    _confirmPasswordFocusNode.unfocus();
  }

  Widget _passStrengthIndicator() {
    return SlideUp(
      delay: const Duration(milliseconds: 400),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: PasswordStrengthIndicator(
          strengthIndex: _passwordStrengthIndex,
        ),
      ),
    );
  }
}
