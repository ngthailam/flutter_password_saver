import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/modules/auth/presentation/auth/authen/authen_bottom_sheet.dart';
import 'package:flutter_password_saver/presentation/page/password/create/password_save_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/widget/password_item_setting_bottom_sheet.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/util/string_ext.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PasswordListItem extends StatefulWidget {
  const PasswordListItem({
    Key? key,
    required this.password,
    required this.prefShowAccName,
  }) : super(key: key);

  final Password password;
  final bool prefShowAccName;

  @override
  State<PasswordListItem> createState() => _PasswordListItemState();
}

class _PasswordListItemState extends State<PasswordListItem> {
  bool _alwaysShow = false;
  bool _requireAuthen = false;
  bool _prefAccNameVisible = false;
  bool _eyeShowAllContent = false;

  @override
  void initState() {
    bool? passSettingAlwaysShow;

    for (var e in widget.password.settings) {
      switch (e.name) {
        case PasswordSettingsName.alwaysShow:
          passSettingAlwaysShow = e.value;
          break;
        case PasswordSettingsName.requireAuthen:
          _requireAuthen = e.value;
          break;
        default:
          break;
      }
    }

    if (passSettingAlwaysShow == true) {
      _alwaysShow = true;
      _eyeShowAllContent = true;
    }

    _prefAccNameVisible = widget.prefShowAccName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey('slide-${widget.password.accName}'),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.8,
        children: _slidableActions(context),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 0.5),
        ),
        child: Row(
          children: [
            _toggleVisibilityIcon(),
            const SizedBox(width: 16),
            _divider(),
            const SizedBox(width: 16),
            _mainContent(),
            const SizedBox(width: 16),
            _trailingIcon(),
          ],
        ),
      ),
    );
  }

  List<SlidableAction> _slidableActions(BuildContext context) {
    return [
      SlidableAction(
        onPressed: (ctx) {
          showPasswordSettingsBottomSheet(
            context,
            password: widget.password,
            onChanged: (PasswordSettingsName name, dynamic value) {
              context.read<PasswordBloc>().add(
                    UpdateSettingsEvent(
                      passwordId: widget.password.id,
                      name: name,
                      value: value,
                    ),
                  );
            },
          );
        },
        backgroundColor: AppColors.green400,
        foregroundColor: Colors.white,
        icon: Icons.settings,
        label: S().settings,
      ),
      SlidableAction(
        onPressed: (ctx) async {
          final result = await Navigator.of(context).pushNamed(
              AppRouter.savePassword,
              arguments: SavePasswordPageArg(id: widget.password.id));
          if (result == true) {
            context
              ..showSuccessSnackBar(S().sbEditSuccess)
              ..read<PasswordBloc>().add(RefreshDataEvent());
          }
        },
        backgroundColor: AppColors.blue400,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: S().edit,
      ),
      SlidableAction(
        onPressed: (ctx) {
          final passwordBloc = context.read<PasswordBloc>();
          passwordBloc.add(DeletePasswordEvent(id: widget.password.id));
          // Show success toast with undo button
          final scaffold = ScaffoldMessenger.of(context);
          scaffold.showSnackBar(
            SnackBar(
              content: Text(S().sbDeletePassword(widget.password.name)),
              action: SnackBarAction(
                  label: S().undo.toUpperCase(),
                  onPressed: () {
                    scaffold.hideCurrentSnackBar;
                    passwordBloc.add(UndoDeletePasswordEvent());
                  }),
            ),
          );
        },
        backgroundColor: AppColors.red400,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: S().delete,
      ),
    ];
  }

  Widget _toggleVisibilityIcon() {
    return GestureDetector(
      onTap: () async {
        if (!_eyeShowAllContent) {
          final authenSucceed = await isAuthenSuccess();
          if (!authenSucceed) {
            return;
          }
        } else {
          if (_alwaysShow) {
            return;
          }
        }

        setState(() {
          _eyeShowAllContent = !_eyeShowAllContent;
        });
      },
      child: Icon(
        _eyeShowAllContent ? Icons.visibility_off : Icons.visibility,
        color: AppColors.blue500,
      ),
    );
  }

  Future<bool> isAuthenSuccess() async {
    if (!_requireAuthen) return true;

    final isAuthenticated = await showAuthenBottomSheet(context);
    return isAuthenticated == true;
  }

  Widget _divider() {
    return Container(
      color: AppColors.blue400,
      width: 1,
      height: 42,
    );
  }

  Widget _mainContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.password.name),
          const SizedBox(height: 4),
          _textWithCopy(widget.password.accName,
              _prefAccNameVisible || _eyeShowAllContent),
          _textWithCopy(widget.password.password, _eyeShowAllContent),
        ],
      ),
    );
  }

  Widget _trailingIcon() {
    return const Icon(
      Icons.menu,
      size: 18,
      color: AppColors.blue500,
    );
  }

  Widget _textWithCopy(String text, bool visible) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text.obscureText(!visible)),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            if (visible) {
              Clipboard.setData(ClipboardData(text: text));
              context.showToast(S().copied(text));
            } else {
              context.showToast(S().sbEye);
            }
          },
          child: const Icon(
            Icons.copy,
            size: 12,
          ),
        )
      ],
    );
  }
}
