import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:flutter_password_saver/presentation/page/password/create/password_save_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/presentation/page/password/list/widget/password_item_setting_bottom_sheet.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:flutter_password_saver/util/string_ext.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:collection/collection.dart';

class PasswordListItem extends StatefulWidget {
  const PasswordListItem({
    Key? key,
    required this.password,
    this.forceShow = false,
  }) : super(key: key);

  final Password password;
  final bool forceShow;

  @override
  State<PasswordListItem> createState() => _PasswordListItemState();
}

class _PasswordListItemState extends State<PasswordListItem> {
  bool _contentVisible = false;
  bool _alwaysShow = false;

  @override
  void initState() {
    bool? passSettingAlwaysShow = widget.password.settings
        .firstWhereOrNull(
            (element) => element.name == PasswordSettingsName.alwaysShow)
        ?.value;
    if (passSettingAlwaysShow == true) {
      _alwaysShow = true;
      _contentVisible = true;
    } else if (passSettingAlwaysShow == null && widget.forceShow) {
      // Only check null, to respect individual's password preference
      // over universal settings
      _alwaysShow = true;
      _contentVisible = true;
    }
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
            onChanged: (name, value) {
              switch (name) {
                case PasswordSettingsName.alwaysShow:
                  context.read<PasswordBloc>().add(
                        UpdateSettingsEvent(
                          passwordId: widget.password.id,
                          name: name,
                          value: value,
                        ),
                      );
                  break;
                default:
                  break;
              }
            },
          );
        },
        backgroundColor: AppColors.green400,
        foregroundColor: Colors.white,
        icon: Icons.settings,
        label: 'Settings',
      ),
      SlidableAction(
        onPressed: (ctx) {
          Navigator.of(context).pushNamed(AppRouter.savePassword,
              arguments: SavePasswordPageArg(id: widget.password.id));
        },
        backgroundColor: AppColors.blue400,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'Edit',
      ),
      SlidableAction(
        onPressed: (ctx) {
          context
              .read<PasswordBloc>()
              .add(DeletePasswordEvent(id: widget.password.id));
          context.showSuccessSnackBar(
              'Deleted password for [${widget.password.name}]');
        },
        backgroundColor: AppColors.red400,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
    ];
  }

  Widget _toggleVisibilityIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_alwaysShow) {
            return;
          }
          _contentVisible = !_contentVisible;
        });
      },
      child: Icon(
        _contentVisible ? Icons.visibility_off : Icons.visibility,
        color: AppColors.blue500,
      ),
    );
  }

  Widget _divider() {
    return Container(
      color: AppColors.blue400,
      width: 1,
      height: 42,
    );
  }

  Widget _mainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.password.name),
        const SizedBox(height: 4),
        _textWithCopy(widget.password.accName),
        _textWithCopy(widget.password.password),
      ],
    );
  }

  Widget _textWithCopy(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text.obscureText(!_contentVisible)),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            if (_contentVisible) {
              Clipboard.setData(ClipboardData(text: text));
              context.showToast('Coppied: $text');
            } else {
              context.showToast(
                'Must press eye icon to toggle visibility before copying',
              );
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
