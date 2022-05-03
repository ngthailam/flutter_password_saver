import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/util/debouncer.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    Key? key,
    this.onChanged,
    this.margin = const EdgeInsets.symmetric(),
    this.padding = const EdgeInsets.only(left: 16, right: 8),
    this.onProfileTap,
    this.accountNameInitials,
  }) : super(key: key);

  final Debouncer _debouncer = Debouncer(milliseconds: 350);

  final Function(String text)? onChanged;
  final VoidCallback? onProfileTap;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String? accountNameInitials;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ink100,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: margin,
      padding: padding,
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.blue500),
          const SizedBox(width: 8),
          _textField(),
          _profileIcon(),
        ],
      ),
    );
  }

  Widget _textField() {
    return Expanded(
      child: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
        ),
        maxLines: 1,
        onChanged: (text) => _debouncer.run(() {
          onChanged?.call(text);
        }),
      ),
    );
  }

  Widget _profileIcon() {
    return GestureDetector(
      onTap: () => onProfileTap?.call(),
      child: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blue400,
        ),
        child: Center(
            child: Text(
          accountNameInitials ?? '',
          style: const TextStyle(color: AppColors.white500),
        )),
      ),
    );
  }
}
