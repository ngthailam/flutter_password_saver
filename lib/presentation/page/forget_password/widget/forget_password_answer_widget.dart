import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/presentation/page/auth/register/util/security_question.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/forget_password/bloc/forget_password_event.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';

class ForgetPasswordAnswer extends StatefulWidget {
  const ForgetPasswordAnswer({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordAnswer> createState() => _ForgetPasswordAnswerState();
}

class _ForgetPasswordAnswerState extends State<ForgetPasswordAnswer> {
  TextEditingController? _textEdtCtrl;
  SecurityQuestion? _chosenQuestion;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _textEdtCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _textEdtCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _primary();
  }

  Widget _primary() {
    return Stack(
      children: [
        Positioned(
          top: 32,
          child: IconButton(
            color: AppColors.white500,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 80, right: 16, bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _title(),
                const SizedBox(height: 32),
                _questionPicker(),
                _answerTextField(),
                const SizedBox(height: 8),
                _errorText(),
              ],
            ),
          ),
        ),
        Positioned(bottom: 8, child: _confirmBtn()),
      ],
    );
  }

  Widget _questionPicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: DropdownButton<SecurityQuestion>(
        value: _chosenQuestion,
        items: SecurityQuestion.questionList().map((e) {
          return DropdownMenuItem(
            child: Text(e.question),
            value: e,
          );
        }).toList(),
        onChanged: (SecurityQuestion? value) {
          if (value != null && value != _chosenQuestion) {
            setState(() {
              _showError = false;
              _chosenQuestion = value;
            });
          }
        },
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Answer your security question to retrieve pass word',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _answerTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: TextField(
        cursorColor: AppColors.blue500,
        decoration: const InputDecoration(hintText: 'Answer'),
        controller: _textEdtCtrl,
        onChanged: (text) {
          _chosenQuestion = _chosenQuestion?.copyWith(answer: text);
          if (_showError) {
            setState(() {
              _showError = false;
            });
          }
        },
      ),
    );
  }

  Widget _confirmBtn() {
    return PrimaryButton(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      width: MediaQuery.of(context).size.width - 60,
      onPressed: () {
        if (_textEdtCtrl?.text.isNotEmpty == true) {
          context
              .read<ForgetPasswordBloc>()
              .add(AnswerQuestionEvent(answer: _chosenQuestion!));
        } else {
          setState(() {
            _showError = true;
          });
        }
      },
      text: 'Confirm',
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
}
