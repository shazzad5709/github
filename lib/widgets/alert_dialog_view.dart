import 'package:flutter/material.dart';
import 'package:githubdummy/widgets/text_button_view.dart';

class AlertDialogView extends StatelessWidget {
  const AlertDialogView({
    super.key,
    required this.title,
    required this.content,
    this.onAcceptPressed,
    this.onCancelPressed,
    this.acceptText = 'OK',
    this.cancelText = 'Cancel',
    this.icon,
  });

  final String title;
  final String content;
  final void Function()? onAcceptPressed;
  final void Function()? onCancelPressed;
  final String acceptText;
  final String cancelText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(icon),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButtonView(
          text: cancelText,
          onPressed: onCancelPressed,
        ),
        TextButtonView(
          text: acceptText,
          onPressed: onAcceptPressed,
        ),
      ],
    );
  }
}
