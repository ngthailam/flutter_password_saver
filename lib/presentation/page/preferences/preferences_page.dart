import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_bloc.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_event.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/platform_switch_widget.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final PreferencesBloc _bloc = getIt<PreferencesBloc>();

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => _bloc..add(PreferenceInitEvent()),
          child: BlocConsumer<PreferencesBloc, PreferenceState>(
            listener: ((context, state) {
              // Do something here
            }),
            builder: (context, state) {
              switch (state.loadState) {
                case LoadState.loading:
                  return const Center(child: Text('Loading'));
                case LoadState.failure:
                  return const Center(child: Text('Error'));
                case LoadState.success:
                  return _primary(state);
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _primary(PreferenceState state) {
    return CustomScrollView(
      slivers: [
        _accountDetails(state.user),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        _preferences(state.preference),
      ],
    );
  }

  Widget _accountDetails(User? user) {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AccountIcon(
            user: user,
            size: 48,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(user?.name ?? '')),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _preferences(AccountPreference? preference) {
    return SliverList(
      delegate: SliverChildListDelegate(preference?.items
              .map((e) => _preferenceItem(
                    left: _getPrefLeftWidget(e),
                    prefItem: e,
                  ))
              .toList() ??
          []),
    );
  }

  Widget _getPrefLeftWidget(AccountPreferenceItem pref) {
    switch (pref.name) {
      case PreferenceName.requirePass:
        return const Text('Require login on open app');
      case PreferenceName.alwaysShowPass:
        return const Text('Always show account names and passwords in list');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _preferenceItem({
    required Widget left,
    required AccountPreferenceItem prefItem,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: left,
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: PlatformSwitch(
                value: prefItem.value as bool,
                onChanged: (value) {
                  switch (prefItem.name) {
                    case PreferenceName.requirePass:
                      _bloc.add(PreferenceSaveRequireLoginEvent(value));
                      break;
                    case PreferenceName.alwaysShowPass:
                      _bloc.add(PreferenceSaveAlwaysShowPasswordEvent(value));
                      break;
                    default:
                      break;
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
