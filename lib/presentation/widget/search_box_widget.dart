import 'package:flutter/material.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/util/debouncer.dart';
import 'package:flutter_password_saver/util/theme_util.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    Key? key,
    this.onChanged,
    this.margin = const EdgeInsets.symmetric(),
    this.padding = const EdgeInsets.only(left: 16, right: 8),
    this.trailingWidget = const SizedBox.shrink(),
  }) : super(key: key);

  final Debouncer _debouncer = Debouncer(milliseconds: 350);

  final Function(String text)? onChanged;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode() ? AppColors.ink500 : AppColors.ink100,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: margin,
      padding: padding,
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.blue500),
          const SizedBox(width: 8),
          _textField(),
          trailingWidget,
        ],
      ),
    );
  }

  Widget _textField() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: S().search,
        ),
        maxLines: 1,
        autofocus: false,
        onChanged: (text) => _debouncer.run(() {
          onChanged?.call(text);
        }),
      ),
    );
  }
}
