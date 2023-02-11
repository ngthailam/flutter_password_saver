import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/usecase/preference/account_preference_use_case.dart';
import 'package:flutter_password_saver/modules/auth/domain/usecase/get_current_account_use_case.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_event.dart';
import 'package:flutter_password_saver/presentation/page/gateway/bloc/gateway_state.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:injectable/injectable.dart';

@injectable
class GatewayBloc extends Bloc<GatewayEvent, GatewayState> {
  GatewayBloc(
    this._getCurrentAccountUseCase,
    this._accountPreferenceUseCase,
  ) : super(GatewayState()) {
    on<OpenStartPageEvent>(_openStartPage);
  }

  final GetCurrentAccountUseCase _getCurrentAccountUseCase;
  final AccountPreferenceUseCase _accountPreferenceUseCase;

  FutureOr<void> _openStartPage(
    OpenStartPageEvent event,
    Emitter<GatewayState> emit,
  ) async {
    String destinationRouteName = AppRouter.register;
    final result = await _getCurrentAccountUseCase.execute(null);

    if (result != null) {
      // user is registered
      final pref = await _accountPreferenceUseCase.getAccountPrefs();
      if (pref.getItemByName(PreferenceName.requirePass)?.value == false) {
        destinationRouteName = AppRouter.initialRoute;
      } else {
        destinationRouteName = AppRouter.login;
      }
    }

    // unregistered
    emit(state.copyWith(destinationRouteName: destinationRouteName));
  }
}
