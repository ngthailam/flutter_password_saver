import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_bloc.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_events.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_state.dart';
import 'package:flutter_password_saver/presentation/page/info/list/widgets/info_list_item.dart';
import 'package:flutter_password_saver/presentation/page/preferences/preferences_page.dart';
import 'package:flutter_password_saver/presentation/utils/load_state.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/empty_state.dart';
import 'package:flutter_password_saver/presentation/widget/search_box_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with AutomaticKeepAliveClientMixin {
  final InfoBloc _bloc = getIt<InfoBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _bloc..add(InfoInitializeEvent()),
          child: BlocConsumer<InfoBloc, InfoState>(
            listener: (BuildContext context, InfoState state) {
              // Do things here
            },
            builder: (BuildContext context, InfoState state) {
              return AnimatedCrossFade(
                key: const Key('info_cross_fade_main'),
                // Since this load very fast, no need for loading indicator
                // indicator will make it looks jaggy
                firstChild: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                ),
                secondChild: _body(state),
                crossFadeState: (state.loadState == LoadState.none ||
                            state.loadState == LoadState.loading) &&
                        state.infos.isEmpty
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

  Widget _body(InfoState state) {
    return Stack(
      children: [
        const SizedBox(height: 16),
        _searchBox(state.user),
        _resolveMainContent(state),
        _createPassFab(),
      ],
    );
  }

  Widget _resolveMainContent(InfoState state) {
    return state.infos.isEmpty
        ? _emptyState(isSearching: _bloc.isSearching)
        : _infoList(state.infos);
  }

  Widget _infoList(List<Info> infoList) {
    return Container(
      // 64 == SearchBox height, to avoid widget collision
      margin: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          final item = infoList[i];
          return InfoListItem(info: item);
        },
        itemCount: infoList.length,
      ),
    );
  }

  Widget _createPassFab() {
    return BlocBuilder<InfoBloc, InfoState>(
      buildWhen: (previous, current) {
        return previous.infos.isEmpty || current.infos.isEmpty;
      },
      builder: (context, state) {
        if (state.infos.isEmpty && !_bloc.isSearching) {
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
              onPressed: _goToSaveInfo,
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }

  Widget _searchBox(User? user) {
    return BlocBuilder<InfoBloc, InfoState>(
      buildWhen: (previous, current) {
        return previous.infos.isEmpty || current.infos.isEmpty;
      },
      builder: (context, state) {
        if (state.infos.isEmpty && !_bloc.isSearching) {
          return const SizedBox.shrink();
        }
        return SearchBox(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onChanged: (text) {
            _bloc.add(SearchInfoEvent(keyword: text));
          },
          trailingWidget: Builder(
            builder: (ctx) {
              return AccountIcon(
                user: user,
                onTap: () async {
                  final needsUpdate = await showPreferencePage(ctx);
                  if (needsUpdate == true) {
                    _bloc.add(InfoRefreshDataEvent());
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _emptyState({required bool isSearching}) {
    return isSearching
        ? EmptyState(
            description: S().noResults,
          )
        : EmptyState(
            description: S().emptyInfoHint,
            ctaText: S().textContinue,
            onCtaPressed: _goToSaveInfo,
          );
  }

  void _goToSaveInfo() async {
    final result = await Navigator.of(context).pushNamed(AppRouter.saveInfo);
    if (result == true) {
      _bloc.add(InfoRefreshDataEvent());
    }
  }
}
