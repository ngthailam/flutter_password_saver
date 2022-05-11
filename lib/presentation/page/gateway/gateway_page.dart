import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_bloc.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_event.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_state.dart';
import 'package:flutter_password_saver/presentation/widget/loading_indicator.dart';

class GatewayPage extends StatefulWidget {
  const GatewayPage({Key? key}) : super(key: key);

  @override
  State<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends State<GatewayPage> {
  final GatewayBloc _bloc = getIt<GatewayBloc>();

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
    return BlocConsumer<GatewayBloc, GatewayState>(
      listener: (context, state) {
        if (state.destinationRouteName != null) {
          Navigator.of(context).popAndPushNamed(state.destinationRouteName!);
        }
      },
      builder: (context, state) {
        return Center(
          child: LoadingIndicator(color: LoadingIndicator.defaultColor),
        );
      },
    );
  }
}
