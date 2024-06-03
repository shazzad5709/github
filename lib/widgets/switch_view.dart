import 'package:flutter/material.dart';

class SwitchView extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const SwitchView({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (_) {
        onChanged?.call(!value);
      },
    );
  }
}
