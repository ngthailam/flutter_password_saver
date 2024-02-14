import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';

part 'account_preference_entity.g.dart';

@CopyWith()
class AccountPreferenceEntity {
  AccountPreferenceEntity({
    required this.items,
  });

  final List<AccountPreferenceItem> items;

  AccountPreference toModel() => AccountPreference(items: items);

  dynamic getItemValue(AppPreferenceEnum prefEnum) {
    return items
            .firstWhereOrNull((element) => element.name == prefEnum)
            ?.value ??
        prefEnum.defaultValue;
  }
}
