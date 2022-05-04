import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:collection/collection.dart';

part 'account_preference.g.dart';

@CopyWith()
class AccountPreference {
  static const requireLoginDefault = true;
  static const alwaysShowPasswordsDefault = false;

  AccountPreference({this.items = defaultPrefItems});

  final List<AccountPreferenceItem> items;

  static const List<AccountPreferenceItem> defaultPrefItems = [
    AccountPreferenceItem(
      name: PreferenceName.requirePass,
      value: requireLoginDefault,
    ),
    AccountPreferenceItem(
      name: PreferenceName.alwaysShowPass,
      value: alwaysShowPasswordsDefault,
    ),
  ];

  AccountPreference copyWithNewItem(AccountPreferenceItem item) {
    final itemIdx = items.indexWhere((element) => element.name == item.name);

    List<AccountPreferenceItem> newPrefItems = items;
    if (itemIdx == -1) {
      newPrefItems.add(item);
    } else {
      newPrefItems[itemIdx] = item;
    }

    return copyWith(items: newPrefItems);
  }

  AccountPreferenceItem? getItemByName(PreferenceName name) {
    final matchingItems = items.where((element) => element.name == name);
    return matchingItems.isEmpty ? null : matchingItems.first;
  }
}

enum PreferenceName {
  requirePass,
  alwaysShowPass,
}

@CopyWith()
class AccountPreferenceItem {
  const AccountPreferenceItem({required this.name, this.value});

  final PreferenceName name;
  final dynamic value;
}
