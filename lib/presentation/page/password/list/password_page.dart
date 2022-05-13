import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/user.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/main.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_state.dart';
import 'package:flutter_password_saver/presentation/page/password/list/widget/password_list_item.dart';
import 'package:flutter_password_saver/presentation/page/preferences/preferences_page.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/account_icon_widget.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_password_saver/presentation/widget/search_box_widget.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:flutter_svg/svg.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> with RouteAware {
  late PasswordBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PasswordBloc>();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _bloc.add(RefreshDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => _bloc..add(InitializeEvent()),
          child: BlocConsumer<PasswordBloc, PasswordState>(
            listener: (BuildContext context, PasswordState state) {
              // Fill if needed
            },
            builder: (BuildContext context, PasswordState state) {
              return _body(state);
            },
          ),
        ),
      ),
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
      margin: const EdgeInsets.only(top: 64),
      child: ListView.builder(
        itemCount: _bloc.state.passwords.length,
        itemBuilder: (context, i) {
          final item = _bloc.state.passwords[i];
          return PasswordListItem(
            key: ObjectKey(item),
            password: item,
            forceShow: _bloc.prefAlwaysShowPassword,
            onChangeSetting: (settings) {
              _bloc.add(
                UpdateSettingsEvent(
                  passwordId: item.id,
                  name: settings.name,
                  value: settings.value,
                ),
              );
            },
          );
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
        child: FloatingActionButton(
          backgroundColor: AppColors.blue500,
          foregroundColor: AppColors.white500,
          child: const Icon(Icons.add),
          onPressed: _goToSavePassword,
        ),
      ),
    );
  }

  Widget _searchBox(User? user) {
    return Builder(
      builder: (BuildContext context) {
        return SearchBox(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onChanged: (text) {
            _bloc.add(SearchPasswordEvent(keyword: text));
          },
          trailingWidget: AccountIcon(
            user: user,
            onTap: () => showPreferencePage(context),
          ),
        );
      },
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
      context.showSuccessSnackBar(S().sbEditSuccess);
    }
  }
}
