import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_bloc.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_event.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_state.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/delete_account_button_widget.dart';
import 'package:flutter_password_saver/presentation/widget/hot_restart_widget.dart';
import 'package:flutter_password_saver/presentation/widget/icon_ink_well_widget.dart';
import 'package:flutter_password_saver/presentation/widget/loading_indicator.dart';
import 'package:flutter_password_saver/presentation/widget/platform_switch_widget.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:flutter_password_saver/util/theme_util.dart';
import 'package:collection/collection.dart';

Future<void> showPreferencePage(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: AppColors.ink300,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: const PreferencesPage(),
      );
    },
  );
}

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
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.height * 0.9,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocProvider(
        create: (context) => _bloc..add(PreferenceInitEvent()),
        child: BlocConsumer<PreferencesBloc, PreferenceState>(
          listener: ((context, state) {
            if (state.deleteLoadState != LoadState.none) {
              if (state.deleteLoadState == LoadState.success) {
                context.showErrorSnackBar('Delete success');
                HotRestart.of(context).hotRestart();
              }

              if (state.deleteLoadState == LoadState.failure) {
                context.showErrorSnackBar('Delete failed');
              }
            }

            final isEnableDarkMode = state.preference?.items
                .firstWhereOrNull(
                    (element) => element.name == PreferenceName.enableDarkMode)
                ?.value;
            if (isEnableDarkMode != null && isEnableDarkMode != isDarkMode()) {
              changeThemeMode();
            }
          }),
          builder: (context, state) {
            switch (state.loadState) {
              case LoadState.loading:
                return Center(
                    child: LoadingIndicator(
                  color: LoadingIndicator.defaultColor,
                ));
              case LoadState.failure:
                return const Center(child: Text('Error'));
              case LoadState.success:
                if (state.deleteLoadState == LoadState.none) {
                  return _primary(state);
                } else {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        LoadingIndicator(),
                        SizedBox(height: 8),
                        Text('Deleting account ...')
                      ],
                    ),
                  );
                }
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _primary(PreferenceState state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _appBar(),
        const SizedBox(height: 16),
        _accountDetails(state.user),
        const SizedBox(height: 16),
        DeleteAccountButton(
          onPressed: () => _bloc.add(DeleteAccountEvent()),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Divider(
            color: AppColors.ink200,
          ),
        ),
        _preferences(state.preference),
      ],
    );
  }

  Widget _appBar() {
    return Stack(
      children: [
        _closeBtn(),
        const Center(
          child: Text(
            'Preferences',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _closeBtn() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.close),
      ),
    );
  }

  Widget _accountDetails(User? user) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AccountIcon(
          user: user,
          size: 40,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            user?.name ?? '',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        IconInkWell(
          icon: Icon(
            Icons.edit,
            size: 20,
            color: isDarkMode() ? AppColors.white400 : AppColors.ink400,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(AppRouter.updatePassword);
          },
        ),
      ],
    );
  }

  Widget _preferences(AccountPreference? preference) {
    final items = preference?.items;
    if (items == null) {
      return const SizedBox.shrink();
    }

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return _preferenceItem(
            left: _getPrefLeftWidget(items[i]),
            prefItem: items[i],
          );
        },
      ),
    );
  }

  Widget _getPrefLeftWidget(AccountPreferenceItem pref) {
    switch (pref.name) {
      case PreferenceName.requirePass:
        return const Text('Require login on open app');
      case PreferenceName.alwaysShowPass:
        return const Text('Always show account names and passwords');
      case PreferenceName.enableDarkMode:
        return const Text('Enable Dark mode');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _preferenceItem({
    required Widget left,
    required AccountPreferenceItem prefItem,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
                  _bloc.add(
                    SavePreferenceEvent(name: prefItem.name, value: value),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
