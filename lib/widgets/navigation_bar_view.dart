import 'package:flutter/material.dart';
import 'package:githubdummy/features/bottom_nav/view_model/bottom_nav_view_model.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({
    super.key,
    required this.items,
    required this.screens,
    required this.viewModel,
  });

  final BottomNavigationViewModel viewModel;
  final List<NavigationDestination> items;
  final Map<int, Widget> screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: viewModel.selectedIndex,
        children: screens.values.toList(),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: viewModel.selectedIndex,
        destinations: items,
        onDestinationSelected: (index) => viewModel.setSelectedIndex(index),
      ),
    );
  }
}
