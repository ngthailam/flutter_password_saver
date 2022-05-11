import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_event.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/bloc/register_state.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/util/security_question.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/widget/password_input_page.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_alert_dialog.dart';
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
          _BenefitPage(onPressed: _animateToNextPage),
          _NameInputPage(onContinue: (name) {
            _animateToNextPage();
            _registerBloc.add(ConfirmNameEvent(name: name));
          }),
          PasswordInputPage(
            userName: _registerBloc.inputUserName,
            onBackPressed: _animateToPrevPage,
            onConfirm: (password) {
              _animateToNextPage();
              _registerBloc.add(ConfirmPasswordEvent(password: password));
            },
            btnWidth: MediaQuery.of(context).size.width - 96,
            btnMargin: const EdgeInsets.symmetric(horizontal: 48),
          ),
          _SecurityQuestionPage(
            onBackPressed: _animateToPrevPage,
            onSkip: () {
              _registerBloc.add(ConfirmSecurityQuestionEvent());
            },
            onAnswer: (question) => _registerBloc
                .add(ConfirmSecurityQuestionEvent(question: question)),
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
            _PageIndicator(isActive: _selectedIndex == 4),
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
          style: const TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 14),
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
  late FocusNode _textFocusNode;

  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textEditingController = TextEditingController(text: widget.name ?? '');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textFocusNode.dispose();
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
                const SizedBox(height: 36),
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
      onComplete: () {
        _textFocusNode.requestFocus();
      },
      delay: const Duration(milliseconds: 200),
      child: TextField(
        focusNode: _textFocusNode,
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
          _textFocusNode.unfocus();
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

class _SecurityQuestionPage extends StatefulWidget {
  const _SecurityQuestionPage({
    Key? key,
    required this.onBackPressed,
    required this.onSkip,
    required this.onAnswer,
  }) : super(key: key);

  final VoidCallback onBackPressed;
  final VoidCallback onSkip;
  final Function(SecurityQuestion question) onAnswer;

  @override
  State<_SecurityQuestionPage> createState() => __SecurityQuestionPageState();
}

class __SecurityQuestionPageState extends State<_SecurityQuestionPage> {
  late TextEditingController _textEditingController;
  late FocusNode _answerFocusNode;
  SecurityQuestion? _chosenQuestion;
  bool _showError = false;

  List<SecurityQuestion> questions = SecurityQuestion.questionList();

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _answerFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _answerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backButton(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: ListView(
            children: [
              SizedBox(height: (MediaQuery.of(context).size.height) / 8),
              _title(),
              const SizedBox(height: 48),
              _questionPicker(),
              const SizedBox(height: 8),
              _answerTextField(),
              const SizedBox(height: 8),
              _errorText(),
            ],
          ),
        ),
        _confirmBtn(),
      ],
    );
  }

  Widget _backButton(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              _unfocus();
              widget.onBackPressed.call();
            },
            child: const Padding(
                padding: EdgeInsets.all(16), child: Icon(Icons.arrow_back)),
          ),
          TextButton(
            onPressed: () async {
              _unfocus();
              await showAlertDialog(
                context: context,
                content:
                    'If you dont answer, you cannot use forget password function',
                defaultActionText: 'Confirm',
                cancelActionText: 'Cancel',
                onDefaultAction: () {
                  Navigator.of(context).pop();
                  widget.onSkip();
                },
              );
            },
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return const SlideUp(
      child: Text(
        '(Optional) Answer a question to retrieve your password when you forget it.',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _questionPicker() {
    return SlideUp(
      delay: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: DropdownButton<SecurityQuestion>(
          elevation: 0,
          enableFeedback: true,
          isExpanded: true,
          value: _chosenQuestion,
          items: questions.map((e) {
            return DropdownMenuItem(
              child: Text(e.question),
              value: e,
            );
          }).toList(),
          onChanged: (value) {
            if (value != _chosenQuestion) {
              setState(() {
                _showError = false;
                _chosenQuestion = value;
              });
              _answerFocusNode.requestFocus();
            }
          },
        ),
      ),
    );
  }

  Widget _answerTextField() {
    return SlideUp(
      delay: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: TextField(
          cursorColor: AppColors.blue500,
          decoration: const InputDecoration(hintText: 'Answer'),
          controller: _textEditingController,
          onChanged: (text) {
            if (_showError) {
              setState(() {
                _showError = false;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _confirmBtn() {
    return Positioned(
      bottom: 0,
      child: SlideUp(
        delay: const Duration(milliseconds: 400),
        child: _Button(
          onPressed: () {
            _unfocus();
            if (_textEditingController.text.isEmpty) {
              setState(() {
                _showError = true;
              });
            } else {
              widget.onAnswer(_chosenQuestion!
                  .copyWith(answer: _textEditingController.text));
            }
          },
          text: 'Answer',
        ),
      ),
    );
  }

  Widget _errorText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedOpacity(
          opacity: _showError ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          child: const Text(
            'Answer must not be empty',
            style: TextStyle(color: AppColors.red500),
          ),
        ),
      ),
    );
  }

  void _unfocus() {
    _answerFocusNode.unfocus();
  }
}
