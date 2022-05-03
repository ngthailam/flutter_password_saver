import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_bloc.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_event.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_state.dart';
import 'package:flutter_password_saver/util/app_router.dart';

class GatewayPage extends StatefulWidget {
  const GatewayPage({Key? key}) : super(key: key);

  @override
  State<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends State<GatewayPage> {
  final GatewayBloc _bloc = getIt<GatewayBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc..add(OpenStartPageEvent()),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<GatewayBloc, GatewayState>(listener: ((context, state) {
      if (state.userStatus == UserStatus.registered) {
        Navigator.of(context).popAndPushNamed(AppRouter.login);
      } else if (state.userStatus == UserStatus.unregistered) {
        Navigator.of(context).popAndPushNamed(AppRouter.register);
      }
    }), builder: (context, state) {
      if (state.userStatus == null) {
        return const Center(
          child: Text('Loading...'),
        );
      }

      return const SizedBox.shrink();
    });
  }
}
