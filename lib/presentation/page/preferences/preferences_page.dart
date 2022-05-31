import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_bloc.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_event.dart';
import 'package:flutter_password_saver/presentation/page/preferences/bloc/preferences_state.dart';
import 'package:flutter_password_saver/presentation/page/preferences/widget/pref_item_widget_factory.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/delete_account_button_widget.dart';
import 'package:flutter_password_saver/presentation/widget/hot_restart_widget.dart';
import 'package:flutter_password_saver/presentation/widget/icon_ink_well_widget.dart';
import 'package:flutter_password_saver/presentation/widget/loading_indicator.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/initializer/language_util.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';

Future<bool?> showPreferencePage(BuildContext context) {
  return showDialog<bool>(
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(_bloc.dataChanged);
        return false;
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.height * 0.9,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: BlocProvider(
          create: (context) => _bloc..add(PreferenceInitEvent()),
          child: BlocConsumer<PreferencesBloc, PreferenceState>(
            listener: ((context, state) {
              if (state.deleteLoadState != LoadState.none) {
                if (state.deleteLoadState == LoadState.success) {
                  context.showErrorSnackBar(S().sbDeleteSuccess);
                  HotRestart.of(context).hotRestart();
                }

                if (state.deleteLoadState == LoadState.failure) {
                  context.showErrorSnackBar(S().sbDeleteError);
                }
              }

              if (state.loadState == LoadState.failure) {
                context.showErrorSnackBar(S().errorUnknown);
                return;
              }

              final isEnableDarkMode =
                  state.preference?.getItemValue(PreferenceName.enableDarkMode);
              if (isEnableDarkMode != null &&
                  isEnableDarkMode != isDarkMode()) {
                changeThemeMode();
              }

              final isChangeLanguage =
                  state.preference?.getItemValue(PreferenceName.languageCode);
              if (isChangeLanguage != null) {
                setLanguage(isChangeLanguage);
              }
            }),
            builder: (context, state) {
              switch (state.loadState) {
                case LoadState.loading:
                  return Center(
                    child: LoadingIndicator(
                      color: LoadingIndicator.defaultColor,
                    ),
                  );
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
        Center(
          child: Text(
            S().preferences,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _closeBtn() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(_bloc.dataChanged),
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
    final factory = PrefItemWidgetFactory();
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return factory.create(
            preferenceItem: items[i],
            onUpdate: (AccountPreferenceItem pref) {
              _bloc.add(
                SavePreferenceEvent(name: pref.name, value: pref.value),
              );
            },
          );
        },
      ),
    );
  }
}
