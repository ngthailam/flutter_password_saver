import 'package:flutter/material.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/initializer/theme_util.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';

class PrefItemChooseLanguage extends StatefulWidget {
  const PrefItemChooseLanguage({
    Key? key,
    required this.preferenceItem,
    this.onUpdate,
  }) : super(key: key);

  final AccountPreferenceItem preferenceItem;
  final Function(AccountPreferenceItem)? onUpdate;

  @override
  State<PrefItemChooseLanguage> createState() => _PrefItemChooseLanguageState();
}

class _PrefItemChooseLanguageState extends State<PrefItemChooseLanguage> {
  final languageCodes = ['en', 'vi'];

  String _value = '';

  @override
  void initState() {
    _value = widget.preferenceItem.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S().language),
        Expanded(
          child: SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<String>(
                underline: const SizedBox.shrink(),
                value: _value,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: languageCodes.map((e) {
                  return _item(e);
                }).toList(),
                onChanged: (String? value) {
                  if (value != null && value != _value) {
                    setState(() {
                      _value = value;
                    });
                    widget.onUpdate?.call(
                      widget.preferenceItem.copyWith(value: value),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getDisplayText(String languageCode) {
    switch (languageCode) {
      case 'en':
        return S().langEn;
      case 'vi':
        return S().langVn;
      default:
        return '';
    }
  }

  DropdownMenuItem<String> _item(String e) {
    final isSelected = _value == e;

    var textColor = isDarkMode()
        ? (isSelected ? AppColors.white500 : AppColors.white200)
        : (isSelected ? AppColors.black500 : AppColors.black200);

    return DropdownMenuItem<String>(
      value: e,
      child: Text(
        _getDisplayText(e),
        style: TextStyle(color: textColor),
      ),
    );
  }
}
