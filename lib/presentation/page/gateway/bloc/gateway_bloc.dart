import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/usecase/auth/get_current_account_use_case.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_event.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GatewayBloc extends Bloc<GatewayEvent, GatewayState> {
  GatewayBloc(this._getCurrentAccountUseCase) : super(GatewayState()) {
    on<OpenStartPageEvent>(_openStartPage);
  }

  final GetCurrentAccountUseCase _getCurrentAccountUseCase;

  FutureOr<void> _openStartPage(
    OpenStartPageEvent event,
    Emitter<GatewayState> emit,
  ) async {
    final result = await _getCurrentAccountUseCase.execute(null);
    UserStatus userStatus = UserStatus.unregistered;
    if (result != null) {
      userStatus = UserStatus.registered;
    }
    emit(state.copyWith(userStatus: userStatus));
  }
}
