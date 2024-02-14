import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'account_preference.g.dart';

@CopyWith()
class AccountPreference extends Equatable {
  const AccountPreference({required this.items});

  final List<AccountPreferenceItem> items;

  dynamic getItemValue(AppPreferenceEnum prefEnum) {
    return items
            .firstWhereOrNull((element) => element.name == prefEnum)
            ?.value ??
        prefEnum.defaultValue;
  }

  @override
  List<Object?> get props => [items];
}

enum AppPreferenceEnum {
  // If app require password when user open app from closed to foreground
  requireReLogin(defaultValue: true),
  enableDarkMode(defaultValue: false),
  languageCode(defaultValue: 'en'),
  showAccName(defaultValue: true),
  allowSearchAccName(defaultValue: true),
  // If app require password when user open app from background to foreground
  requirePassOnForeground(defaultValue: true);

  final dynamic defaultValue;

  const AppPreferenceEnum({required this.defaultValue});
}

@CopyWith()
class AccountPreferenceItem extends Equatable {
  const AccountPreferenceItem({required this.name, this.value});

  final AppPreferenceEnum name;
  final dynamic value;

  @override
  List<Object?> get props => [
        name,
        value,
      ];
}
