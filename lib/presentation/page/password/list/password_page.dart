import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/onboarding/onboarding_bottom_sheet.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_state.dart';
import 'package:flutter_password_saver/presentation/page/password/list/widget/password_list_item.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/utils/ui_utils.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/empty_state.dart';
import 'package:flutter_password_saver/presentation/widget/opaque_gesture_detector.dart';
import 'package:flutter_password_saver/presentation/widget/search_box_widget.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/initializer/uri_handler.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage>
    with AutomaticKeepAliveClientMixin {
  final PasswordBloc _bloc = getIt<PasswordBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _bloc..add(InitializeEvent()),
          child: BlocConsumer<PasswordBloc, PasswordState>(
            listener: (BuildContext context, PasswordState state) {
              if (state.loadState == LoadState.success) {
                _handlePendingUri();
                return;
              }

              if (state.shouldShowOnboard &&
                  !_bloc.hasShownOnboardThisSession) {
                _bloc.add(HasShownOnboardEvent());
                SchedulerBinding.instance.addPostFrameCallback((_) async {
                  await Future.delayed(const Duration(milliseconds: 500));
                  _showOnboarding();
                });
                return;
              }
            },
            builder: (BuildContext context, PasswordState state) {
              return AnimatedCrossFade(
                key: const Key('password_cross_fade_main'),
                firstChild: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                ),
                secondChild: _body(state),
                crossFadeState: (state.loadState == LoadState.none ||
                            state.loadState == LoadState.loading) &&
                        state.passwords.isEmpty
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 550),
                alignment: Alignment.center,
                firstCurve: Curves.easeInOut,
                secondCurve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }

  void _handlePendingUri() {
    final uriHandler = getIt<UriHandler>();
    final pendingUri = uriHandler.getPendingUri();
    if (pendingUri == null) return;

    final routeName = pendingUri.getCleanRouteName();
    uriHandler.markPendingUriResolved();

    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => route.settings.name != routeName,
    );
  }

  Widget _body(PasswordState state) {
    return OpaqueGestureDetector(
      onTap: () => unfocus(),
      child: Stack(
        children: [
          const SizedBox(height: 16),
          _searchBox(state.user),
          _resolveMainContent(state),
          _createPassFab(),
        ],
      ),
    );
  }

  Widget _resolveMainContent(PasswordState state) {
    return state.passwords.isEmpty
        ? _emptyState(isSearching: _bloc.isSearching)
        : _passwordList();
  }

  Widget _passwordList() {
    return Container(
      // 64 == SearchBox height, to avoid widget collision
      margin: const EdgeInsets.only(top: 64, right: 16, left: 16),
      child: ReorderableListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          final item = _bloc.state.passwords[i];
          return PasswordListItem(
            key: ObjectKey(item),
            password: item,
            prefShowAccName: _bloc.accountPreference == null
                ? AppPreferenceEnum.showAccName.defaultValue
                : _bloc.accountPreference!
                    .getItemValue(AppPreferenceEnum.showAccName) as bool,
          );
        },
        itemCount: _bloc.state.passwords.length,
        onReorder: (oldIndex, newIndex) {
          _bloc.add(ReOrderPasswordEvent(
            oldIndex: oldIndex,
            newIndex: newIndex,
          ));
        },
      ),
    );
  }

  Widget _createPassFab() {
    return BlocBuilder<PasswordBloc, PasswordState>(
      buildWhen: (prev, current) =>
          prev.passwords.isEmpty || current.passwords.isEmpty,
      builder: (context, state) {
        if (state.passwords.isEmpty && !_bloc.isSearching) {
          return const SizedBox.shrink();
        }
        return Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton(
              backgroundColor: AppColors.blue500,
              foregroundColor: AppColors.white500,
              onPressed: _goToSavePassword,
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  Widget _searchBox(User? user) {
    return BlocBuilder<PasswordBloc, PasswordState>(
      buildWhen: (prev, current) =>
          prev.passwords.isEmpty || current.passwords.isEmpty,
      builder: (context, state) {
        if (state.passwords.isEmpty && !_bloc.isSearching) {
          return const SizedBox.shrink();
        }
        return SearchBox(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onChanged: (text) {
            _bloc.add(SearchPasswordEvent(keyword: text));
          },
          trailingWidget: AccountIcon(
            user: user,
            onTap: () async {
              final needsUpdate =
                  await Navigator.of(context).pushNamed(AppRouter.preference);
              if (needsUpdate == true) {
                _bloc.add(RefreshDataEvent());
              }
            },
          ),
        );
      },
    );
  }

  Widget _emptyState({required bool isSearching}) {
    if (isSearching) {
      return EmptyState(
        description: S().noResults,
      );
    }
    return EmptyState(
      ctaText: S().emptyPasswordHint,
      onCtaPressed: _goToSavePassword,
    );
  }

  Future<void> _goToSavePassword() async {
    final result =
        await Navigator.of(context).pushNamed(AppRouter.savePassword);
    if (result == true) {
      _bloc.add(RefreshDataEvent());
    }
  }

  void _showOnboarding() async {
    await showOnboardingBottomSheet(context);
  }
}
