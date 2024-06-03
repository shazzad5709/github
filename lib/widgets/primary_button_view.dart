import 'package:flutter/material.dart';

class PrimaryButtonView extends StatelessWidget {
  const PrimaryButtonView({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon != null
              ? Icon(
                  icon,
                  size: 20,
                )
              : const SizedBox.shrink(),
          Text(text),
        ],
      ),
    );
  }
}
