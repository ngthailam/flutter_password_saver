import 'package:flutter/widgets.dart';
import 'package:flutter_password_saver/domain/model/account_preference.dart';
import 'package:flutter_password_saver/generated/l10n.dart';
import 'package:flutter_password_saver/presentation/widget/platform_switch_widget.dart';

class PrefItemSwitcher extends StatefulWidget {
  const PrefItemSwitcher({
    Key? key,
    required this.preferenceItem,
    this.onUpdate,
  }) : super(key: key);

  final AccountPreferenceItem preferenceItem;
  final Function(AccountPreferenceItem)? onUpdate;

  @override
  State<PrefItemSwitcher> createState() => _PrefItemSwitcherState();
}

class _PrefItemSwitcherState extends State<PrefItemSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: _getTitleWidget(),
          ),
          const SizedBox(width: 8),
          Align(
            alignment: Alignment.centerRight,
            child: PlatformSwitch(
              value: widget.preferenceItem.value as bool,
              onChanged: (value) {
                widget.onUpdate
                    ?.call(widget.preferenceItem.copyWith(value: value));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getTitleWidget() {
    switch (widget.preferenceItem.name) {
      case AppPreferenceEnum.requireReLogin:
        return Text(S().prefRequireLogin);
      case AppPreferenceEnum.enableDarkMode:
        return Text(S().prefDarkMode);
      case AppPreferenceEnum.showAccName:
        return Text(S().prefDarkModeShowAccName);
      case AppPreferenceEnum.allowSearchAccName:
        return Text(S().prefAllowSearchAccName);
      case AppPreferenceEnum.requirePassOnForeground:
        return Text(S().prefRequirePassOnForeground);
      default:
        return const SizedBox.shrink();
    }
  }
}
