import 'package:flutter/material.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({
    super.key,
    required this.controller,
    required this.labelText,
    this.enabledColor = Colors.white,
    this.focusedColor = Colors.white,
    this.type = TextInputType.text,
  });

  final TextEditingController controller;
  final String labelText;
  final Color enabledColor;
  final Color focusedColor;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      keyboardType: type,
      controller: controller,
      autocorrect: false,
      decoration: const InputDecoration().copyWith(
        labelText: labelText,
      ),
      cursorColor: dark ? Colors.white : Colors.black,
    );
  }
}
