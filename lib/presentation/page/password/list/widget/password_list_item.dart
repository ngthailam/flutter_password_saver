import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/presentation/page/password/create/password_save_page.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_bloc.dart';
import 'package:flutter_password_saver/presentation/page/password/list/bloc/password_events.dart';
import 'package:flutter_password_saver/util/app_router.dart';
import 'package:flutter_password_saver/util/string_ext.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PasswordListItem extends StatefulWidget {
  const PasswordListItem({Key? key, required this.password}) : super(key: key);

  final Password password;

  @override
  State<PasswordListItem> createState() => _PasswordListItemState();
}

class _PasswordListItemState extends State<PasswordListItem> {
  bool _contentVisible = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 1 / 2,
        children: [
          SlidableAction(
            onPressed: (ctx) {
              // TODO: maybe move to bloc ??
              Navigator.of(context).pushNamed(AppRouter.savePassword,
                  arguments: SavePasswordPageArg(
                    id: widget.password.id,
                  ));
            },
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (ctx) {
              context
                  .read<PasswordBloc>()
                  .add(DeletePasswordEvent(id: widget.password.id));
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
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

  Widget _toggleVisibilityIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _contentVisible = !_contentVisible;
        });
      },
      child: Icon(_contentVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  Widget _divider() {
    return Container(
      color: Colors.black,
      width: 1,
      height: 15,
    );
  }

  Widget _mainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.password.name),
        Text(widget.password.accName.obscureText(!_contentVisible)),
        Text(widget.password.password.obscureText(!_contentVisible)),
      ],
    );
  }
}
