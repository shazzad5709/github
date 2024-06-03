import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(dark ? Colors.white : Colors.black),
    );
  }
}
