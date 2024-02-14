import 'package:flutter/material.dart';

class PlatformSwitch extends StatefulWidget {
  const PlatformSwitch({Key? key, this.value = false, this.onChanged})
      : super(key: key);

  final bool value;
  final Function(bool)? onChanged;

  @override
  State<PlatformSwitch> createState() => _PlatformSwitchState();
}

class _PlatformSwitchState extends State<PlatformSwitch> {
  bool _switchValue = false;

  @override
  void initState() {
    _switchValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _switchValue,
      onChanged: _internalOnChanged,
    );
  }

  _internalOnChanged(bool value) {
    setState(() {
      _switchValue = value;
      widget.onChanged?.call(value);
    });
  }
}
