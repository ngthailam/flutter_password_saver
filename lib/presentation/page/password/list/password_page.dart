import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_state.dart';
import 'package:flutter_password_saver/presentation/page/password/list/password_page_tooltip_mixin.dart';
import 'package:flutter_password_saver/presentation/page/password/list/widget/password_list_item.dart';
import 'package:flutter_password_saver/presentation/page/preferences/preferences_page.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/search_box_widget.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/initializer/uri_handler.dart';
import 'package:flutter_svg/svg.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage>
    with PasswordPageTooltipMixin {
  late PasswordBloc _bloc;
  late UriHandler _uriHandler;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PasswordBloc>();
    _uriHandler = getIt<UriHandler>();
  }

  @override
  Widget build(BuildContext context) {
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
                SchedulerBinding.instance?.addPostFrameCallback((_) async {
                  await Future.delayed(const Duration(milliseconds: 500));
                  showTooltips();
                });
                return;
              }
            },
            builder: (BuildContext context, PasswordState state) {
              return AnimatedCrossFade(
                key: const Key('password_cross_fade_main'),
                firstChild: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
    final pendingUri = _uriHandler.getPendingUri();
    if (pendingUri == null) return;

    final routeName = pendingUri.getCleanRouteName();
    _uriHandler.markPendingUriResolved();

    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (route) => route.settings.name != routeName,
    );
  }

  Widget _body(PasswordState state) {
    return SafeArea(
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
        ? (_bloc.isSearching ? _noSearchResultState() : _emptyState())
        : _passwordList();
  }

  Widget _passwordList() {
    return Container(
      // 64 == SearchBox height, to avoid widget collision
      margin: const EdgeInsets.only(top: 64),
      child: ReorderableListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          final item = _bloc.state.passwords[i];
          return PasswordListItem(
            key: ObjectKey(item),
            password: item,
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
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Builder(
          builder: (ctx) {
            fabContext = ctx;
            return FloatingActionButton(
              backgroundColor: AppColors.blue500,
              foregroundColor: AppColors.white500,
              child: const Icon(Icons.add),
              onPressed: _goToSavePassword,
            );
          },
        ),
      ),
    );
  }

  Widget _searchBox(User? user) {
    return SearchBox(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onChanged: (text) {
        _bloc.add(SearchPasswordEvent(keyword: text));
      },
      trailingWidget: Builder(
        builder: (ctx) {
          avatarContext = ctx;
          return AccountIcon(
            user: user,
            onTap: () => showPreferencePage(ctx),
          );
        },
      ),
    );
  }

  Widget _emptyState() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/login.svg',
            height: 160,
            width: 160,
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            margin: const EdgeInsets.symmetric(horizontal: 48),
            text: S().emptyPasswordHint,
            onPressed: _goToSavePassword,
          ),
        ],
      ),
    );
  }

  Widget _noSearchResultState() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/login.svg',
            height: 160,
            width: 160,
          ),
          const SizedBox(height: 32),
          Text(
            S().noResults,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Future<void> _goToSavePassword() async {
    final result =
        await Navigator.of(context).pushNamed(AppRouter.savePassword);
    if (result == true) {
      _bloc.add(RefreshDataEvent());
    }
  }
}
