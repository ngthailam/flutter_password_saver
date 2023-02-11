import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/info.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/initializer/app_router.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_bloc.dart';
import 'package:flutter_password_saver/presentation/page/info/list/bloc/info_events.dart';
import 'package:flutter_password_saver/presentation/page/info/save/save_info_page.dart';
import 'package:flutter_password_saver/presentation/utils/snackbar_ext.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class InfoListItem extends StatefulWidget {
  const InfoListItem({Key? key, required this.info}) : super(key: key);

  final Info info;

  @override
  State<InfoListItem> createState() => _InfoListItemState();
}

class _InfoListItemState extends State<InfoListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey('slide-${widget.info.id}'),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.6,
        children: _slidableActions(context),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 0.5),
        ),
        child: Row(
          children: [
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
        onPressed: (ctx) async {
          final result = await Navigator.of(context).pushNamed(
              AppRouter.saveInfo,
              arguments: SaveInfoPageArg(infoId: widget.info.id));
          if (result == true) {
            context
              ..showSuccessSnackBar(S().sbEditSuccess)
              ..read<InfoBloc>().add(InfoRefreshDataEvent());
          }
        },
        backgroundColor: AppColors.blue400,
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: S().edit,
      ),
      SlidableAction(
        onPressed: (ctx) {
          final passwordBloc = context.read<InfoBloc>();
          passwordBloc.add(DeleteInfoEvent(infoId: widget.info.id));
          // Show success toast with undo button
          final scaffold = ScaffoldMessenger.of(context);
          scaffold.showSnackBar(
            SnackBar(
              content: Text(S().sbDeletePassword(widget.info.name)),
              action: SnackBarAction(
                label: S().undo.toUpperCase(),
                onPressed: () {
                  scaffold.hideCurrentSnackBar;
                  passwordBloc.add(UndoDeleteInfoEvent());
                },
              ),
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

  Widget _mainContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.info.name),
          const SizedBox(height: 4),
          _textWithCopy(widget.info.desc),
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

  Widget _textWithCopy(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: text));
            context.showToast(S().copied(text));
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
