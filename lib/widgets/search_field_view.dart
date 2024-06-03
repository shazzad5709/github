import 'package:flutter/material.dart';

class SearchFieldView extends StatelessWidget {
  SearchFieldView({
    super.key,
    required this.hintText,
    this.onSubmitted,
  });

  final String hintText;
  final TextEditingController controller = TextEditingController();
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: hintText,
      leading: const Icon(Icons.search),
      onSubmitted: onSubmitted,
    );
  }
}
