import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_create_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_create_events.dart';
import 'package:flutter_password_saver/presentation/page/password/create/bloc/password_create_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';

class PasswordCreatePage extends StatefulWidget {
  const PasswordCreatePage({Key? key}) : super(key: key);

  @override
  State<PasswordCreatePage> createState() => _PasswordCreatePageState();
}

class _PasswordCreatePageState extends State<PasswordCreatePage> {
  final PasswordCreateBloc _bloc = getIt<PasswordCreateBloc>();
  late TextEditingController _nameTextEdtCtrl;
  late TextEditingController _accNameTextEdtCtrl;
  late TextEditingController _passwordTextEdtCtrl;

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
    // TODO: implement dispose
    super.dispose();
    _nameTextEdtCtrl.dispose();
    _accNameTextEdtCtrl.dispose();
    _passwordTextEdtCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: BlocProvider(
        create: (ctx) => _bloc,
        child: BlocListener<PasswordCreateBloc, PasswordCreateState>(
          listener: (context, state) {
            if (state.loadState == LoadState.success) {
              Navigator.of(context).pop();
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
      decoration: InputDecoration(hintText: 'Name'),
    );
  }

  Widget _accNameTextField() {
    return TextField(
      controller: _accNameTextEdtCtrl,
      decoration: InputDecoration(hintText: 'Acc Name'),
    );
  }

  Widget _passTextField() {
    return TextField(
      controller: _passwordTextEdtCtrl,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _confirmBtn() {
    return TextButton(
      onPressed: () {
        _bloc.add(PasswordConfirmCreationEvent());
      },
      child: Text('Confirm'),
    );
  }
}
