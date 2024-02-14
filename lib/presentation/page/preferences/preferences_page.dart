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

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({
    Key? key,
    this.onlyShowPreferences = false,
    this.overrideOnBackPressed,
  }) : super(key: key);

  final bool onlyShowPreferences;
  final Function? overrideOnBackPressed;

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
        title: Text(S().preferences),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (widget.overrideOnBackPressed != null) {
              widget.overrideOnBackPressed?.call();
            } else {
              Navigator.of(context).pop(_bloc.dataChanged);
            }
          },
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }

          if (mounted) {
            if (widget.overrideOnBackPressed != null) {
              widget.overrideOnBackPressed?.call();
            } else {
              Navigator.of(context).pop(_bloc.dataChanged);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) => _bloc..add(PreferenceInitEvent()),
            child: BlocConsumer<PreferencesBloc, PreferenceState>(
              listener: _blocListener,
              builder: (context, state) {
                if (state.loadState == LoadState.loading) {
                  return Center(
                    child: LoadingIndicator(
                      color: LoadingIndicator.defaultColor,
                    ),
                  );
                }

                if (state.preference?.items.isNotEmpty == true) {
                  if (state.deleteLoadState == LoadState.none) {
                    return _primary(state);
                  } else {
                    return const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LoadingIndicator(),
                        ],
                      ),
                    );
                  }
                }

                if (state.loadState == LoadState.failure) {
                  return const Center(child: Text('Error'));
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _primary(PreferenceState state) {
    if (widget.onlyShowPreferences) {
      return _preferences(state.preference);
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _accountDetails(state.user),
        const SizedBox(height: 16),
        DeleteAccountButton(
          onPressed: () {
            Navigator.of(context).pop();
            _bloc.add(DeleteAccountEvent());
          },
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Divider(
            color: AppColors.ink200,
          ),
        ),
        Expanded(child: _preferences(state.preference)),
      ],
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
    return ListView.builder(
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
    );
  }

  void _blocListener(BuildContext context, PreferenceState state) {
    if (state.deleteLoadState != LoadState.none) {
      if (state.deleteLoadState == LoadState.success) {
        context.showErrorSnackBar(S().sbDeleteSuccess);
        Navigator.of(context).pop();
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
        state.preference?.getItemValue(AppPreferenceEnum.enableDarkMode);
    if (isEnableDarkMode != null && isEnableDarkMode != isDarkMode()) {
      changeThemeMode();
    }

    final isChangeLanguage =
        state.preference?.getItemValue(AppPreferenceEnum.languageCode);
    if (isChangeLanguage != null) {
      setLanguage(isChangeLanguage);
    }
  }
}
