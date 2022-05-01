import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_state.dart';
import 'package:flutter_password_saver/presentation/page/password/list/widget/password_list_item.dart';
import 'package:flutter_password_saver/presentation/widget/search_box_widget.dart';
import 'package:flutter_password_saver/util/app_router.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> with RouteAware {
  final PasswordBloc _bloc = getIt<PasswordBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _bloc.add(GetPasswordEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc..add(GetPasswordEvent()),
      child: BlocConsumer<PasswordBloc, PasswordState>(
        listener: (BuildContext context, PasswordState state) {
          // TODO
        },
        builder: (BuildContext context, PasswordState state) {
          return _body();
        },
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        const SizedBox(height: 16),
        _searchBox(),
        _passwordList(),
        _createPassFab(),
      ],
    );
  }

  Widget _passwordList() {
    return Container(
      margin: const EdgeInsets.only(top: 64),
      child: ListView.builder(
        itemCount: _bloc.state.passwords.length,
        itemBuilder: (context, i) {
          final item = _bloc.state.passwords[i];
          return PasswordListItem(key: ValueKey(item.id), password: item);
        },
      ),
    );
  }

  Widget _createPassFab() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.savePassword);
          },
        ),
      ),
    );
  }

  Widget _searchBox() {
    return SearchBox(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onChanged: (text) {
        _bloc.add(SearchPasswordEvent(keyword: text));
      },
    );
  }
}
