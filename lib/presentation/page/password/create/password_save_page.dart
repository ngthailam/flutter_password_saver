import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_events.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_save_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

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

  @override
  void initState() {
    super.initState();
    print('[PasswordSavePage] id=${widget.arg?.id}');
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
    // TODO: implement dispose
    super.dispose();
    _nameTextEdtCtrl.dispose();
    _accNameTextEdtCtrl.dispose();
    _passwordTextEdtCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save Password')),
      body: BlocProvider(
        create: (ctx) =>
            _bloc..add(PasswordSavePrefetchEvent(passwordId: widget.arg?.id)),
        child: BlocListener<PasswordSaveBloc, PasswordSaveState>(
          listener: (context, state) {
            if (state.loadState == LoadState.success) {
              Navigator.of(context).pop();
            }

            final password = state.password;
            if (password != null) {
              _nameTextEdtCtrl.text = state.password!.name;
              _accNameTextEdtCtrl.text = state.password!.accName;
              _passwordTextEdtCtrl.text = state.password!.password;
            }
          },
          child: Column(
            children: [
              _nameTextField(),
              _accNameTextField(),
              _passTextField(),
              _confirmBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextField(
      controller: _nameTextEdtCtrl,
      decoration: const InputDecoration(hintText: 'Name'),
    );
  }

  Widget _accNameTextField() {
    return TextField(
      controller: _accNameTextEdtCtrl,
      decoration: const InputDecoration(hintText: 'Acc Name'),
    );
  }

  Widget _passTextField() {
    return TextField(
      controller: _passwordTextEdtCtrl,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _confirmBtn() {
    return TextButton(
      onPressed: () {
        _bloc.add(PasswordSaveConfirmEvent());
      },
      child: const Text('Confirm'),
    );
  }
}
