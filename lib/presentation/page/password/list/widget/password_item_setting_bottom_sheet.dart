import 'package:flutter/material.dart';
import 'package:flutter_password_saver/domain/model/password.dart';
import 'package:flutter_password_saver/domain/model/password_settings.dart';
import 'package:flutter_password_saver/presentation/values/colors.dart';
import 'package:flutter_password_saver/presentation/widget/platform_switch_widget.dart';

Future<void> showPasswordSettingsBottomSheet(
  BuildContext context, {
  Function(PasswordSettingsName name, bool value)? onChanged,
  required Password password,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    ),
    context: context,
    builder: (context) => PasswordSettingsBottomSheet(
      password: password,
      onChanged: onChanged,
    ),
  );
}

final List<PasswordSettings> defaultSettings = [
  const PasswordSettings(name: PasswordSettingsName.alwaysShow, value: false),
];

class PasswordSettingsBottomSheet extends StatefulWidget {
  const PasswordSettingsBottomSheet({
    Key? key,
    this.onChanged,
    required this.password,
  }) : super(key: key);

  final Function(PasswordSettingsName name, bool value)? onChanged;
  final Password password;

  @override
  State<PasswordSettingsBottomSheet> createState() =>
      _PasswordSettingsBottomSheetState();
}

class _PasswordSettingsBottomSheetState
    extends State<PasswordSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    print('[PasswordSettingsBottomSheet] Building ...');
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          const SizedBox(height: 8),
          const Divider(color: AppColors.ink200),
          const SizedBox(height: 8),
          ..._itemList(),
        ],
      ),
    );
  }

  Widget _title() => const Text(
        'Settings',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );

  List<Widget> _itemList() {
    final settings = widget.password.settings;
    List<Widget> items = [];

    for (var defaultElement in defaultSettings) {
      final currentSettingsMatches =
          settings.where((element) => element.name == defaultElement.name);
      final item = _item(
        left: Text(getSettingDisplayName(defaultElement)),
        settings: currentSettingsMatches.isEmpty
            ? defaultElement
            : currentSettingsMatches.first,
      );

      items.add(item);
    }

    return items;
  }

  String getSettingDisplayName(PasswordSettings settings) {
    switch (settings.name) {
      case PasswordSettingsName.alwaysShow:
        return 'Always show account name and password';
      default:
        return '';
    }
  }

  Widget _item({
    required Widget left,
    required PasswordSettings settings,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: left,
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: PlatformSwitch(
                value: settings.value as bool,
                onChanged: (value) {
                  widget.onChanged?.call(
                    settings.name,
                    value,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
