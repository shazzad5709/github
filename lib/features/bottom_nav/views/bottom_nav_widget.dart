import 'package:flutter/material.dart';
import 'package:githubdummy/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:githubdummy/widgets/navigation_bar_view.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  final List<NavigationDestination> items;
  final Map<int, Widget> screens;

  const BottomNavigationWidget({
    super.key,
    required this.items,
    required this.screens,
  });

  @override
  Widget build(BuildContext context) {
    BottomNavigationViewModel viewModel = context.watch<BottomNavigationViewModel>();

    return NavigationBarView(
      items: items,
      screens: screens,
      viewModel: viewModel,
    );
  }
}
