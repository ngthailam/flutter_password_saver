import 'package:flutter/widgets.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/presentation/page/preferences/widget/pref_item_choose_language_widget.dart';
import 'package:flutter_password_saver/presentation/page/preferences/widget/pref_item_switch_widget.dart';

class PrefItemWidgetFactory {
  Widget create({
    required AccountPreferenceItem preferenceItem,
    Function(AccountPreferenceItem)? onUpdate,
  }) {
    switch (preferenceItem.name) {
      case PreferenceName.languageCode:
        return PrefItemChooseLanguage(
          preferenceItem: preferenceItem,
          onUpdate: onUpdate,
        );
      default:
        return PrefItemSwitcher(
          preferenceItem: preferenceItem,
          onUpdate: onUpdate,
        );
    }
  }
}
