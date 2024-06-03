import 'package:flutter/material.dart';

class CheckboxView extends StatelessWidget {
  const CheckboxView({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Checkbox(
        onChanged: (_) {
          onChanged?.call(!value);
        },
        value: value,
        activeColor: Theme.of(context).primaryColor,
      ),
      title: Text(label),
    );
  }
}
