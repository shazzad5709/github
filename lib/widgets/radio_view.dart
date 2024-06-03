import 'package:flutter/material.dart';

class RadioListTileView extends StatelessWidget {
  const RadioListTileView({
    super.key,
    this.onChanged,
    required this.label,
    required this.value,
    required this.groupValue,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool groupValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Radio(
        onChanged: (_) {
          onChanged?.call(!value);
        },
        value: value,
        groupValue: groupValue,
      ),
      title: Text(label),
    );
  }
}
