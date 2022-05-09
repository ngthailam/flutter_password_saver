import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_events.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/primary_text_input.dart';

class SavePasswordPageArg {
  SavePasswordPageArg({this.id});

  final String? id;
}

class PasswordSavePage extends StatefulWidget {
  const PasswordSavePage({Key? key, this.arg}) : super(key: key);

  final SavePasswordPageArg? arg;

  @override
  State<PasswordSavePage> createState() => _PasswordSavePageState();
}

class _PasswordSavePageState extends State<PasswordSavePage> {
  final PasswordSaveBloc _bloc = getIt<PasswordSaveBloc>();
  late TextEditingController _nameTextEdtCtrl;
  late TextEditingController _accNameTextEdtCtrl;
  late TextEditingController _passwordTextEdtCtrl;

  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _nameTextEdtCtrl = TextEditingController()
      ..addListener(() {
        _bloc.onNameChanged(_nameTextEdtCtrl.text);
      });
    _accNameTextEdtCtrl = TextEditingController()
      ..addListener(() {
        _bloc.onAccNameChanged(_accNameTextEdtCtrl.text);
      });
    _passwordTextEdtCtrl = TextEditingController()
      ..addListener(() {
        _bloc.onPasswordChanged(_passwordTextEdtCtrl.text);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextEdtCtrl.dispose();
    _accNameTextEdtCtrl.dispose();
    _passwordTextEdtCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocProvider(
          create: (ctx) =>
              _bloc..add(PasswordSavePrefetchEvent(passwordId: widget.arg?.id)),
          child: BlocListener<PasswordSaveBloc, PasswordSaveState>(
            listener: (context, state) {
              if (state.loadState == LoadState.success) {
                Navigator.of(context).pop(_bloc.isDataChanged);
              }

              final password = state.password;
              if (password != null) {
                _nameTextEdtCtrl.text = state.password!.name;
                _accNameTextEdtCtrl.text = state.password!.accName;
                _passwordTextEdtCtrl.text = state.password!.password;
              }
            },
            child: _primary(),
          ),
        ),
      ),
    );
  }

  Widget _primary() {
    return Stack(
      children: [
        Positioned(
          bottom: 100,
          right: -50,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: AppColors.blue400.withOpacity(0.6),
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: AppColors.blue400,
            ),
          ),
        ),
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
          child: ListView(
            children: [
              _title(),
              const SizedBox(height: 16),
              _notice(),
              const SizedBox(height: 48),
              _nameTextField(),
              _accNameTextField(),
              _passTextField(),
              _errorText(),
              const SizedBox(height: 56), // Avoid bottom button
            ],
          ),
        ),
        Positioned(bottom: 8, child: _confirmBtn()),
      ],
    );
  }

  Widget _errorText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedOpacity(
          opacity: _showError ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          child: const Text(
            'Some fields are empty',
            style: TextStyle(color: AppColors.red500),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Save your Account and Password',
      style: TextStyle(fontSize: 24),
    );
  }

  Widget _notice() {
    return Text(
      'Your password is only saved locally, you can use network activity to check no Internet connection is establish',
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
      ),
    );
  }

  Widget _nameTextField() {
    return PrimaryTextInput(
      icon: Icons.accessibility_sharp,
      controller: _nameTextEdtCtrl,
      hintText: 'Name (Netflix account)',
      margin: const EdgeInsets.symmetric(vertical: 8),
      onChanged: (text) {
        _hideError();
      },
    );
  }

  Widget _accNameTextField() {
    return PrimaryTextInput(
      icon: Icons.group,
      controller: _accNameTextEdtCtrl,
      hintText: 'Account (abc@gmail.com)',
      margin: const EdgeInsets.symmetric(vertical: 8),
      onChanged: (text) {
        _hideError();
      },
    );
  }

  Widget _passTextField() {
    return PrimaryTextInput(
      icon: Icons.lock,
      controller: _passwordTextEdtCtrl,
      hintText: 'Password (123456)',
      obscureText: true,
      margin: const EdgeInsets.symmetric(vertical: 8),
      onChanged: (text) {
        _hideError();
      },
    );
  }

  void _hideError() {
    if (_showError) {
      setState(() {
        _showError = false;
      });
    }
  }

  Widget _confirmBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width - 32,
      child: PrimaryButton(
        margin: EdgeInsets.zero,
        onPressed: () {
          if (_nameTextEdtCtrl.text.isEmpty ||
              _accNameTextEdtCtrl.text.isEmpty ||
              _passwordTextEdtCtrl.text.isEmpty) {
            setState(() {
              _showError = true;
            });
          } else {
            _bloc.add(PasswordSaveConfirmEvent());
          }
        },
        text: 'Save',
      ),
    );
  }
}
