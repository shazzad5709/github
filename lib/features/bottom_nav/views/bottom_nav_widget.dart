import 'package:flutter/material.dart';
import 'package:githubdummy/features/bottom_nav/view_model/bottom_nav_view_model.dart';
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

    return Scaffold(
      body: IndexedStack(
        index: viewModel.selectedIndex,
        children: screens.values.toList(),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: Colors.grey[900],
        elevation: 1,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
        selectedIndex: viewModel.selectedIndex,
        destinations: items,
        onDestinationSelected: (index) => viewModel.setSelectedIndex(index),
      ),
    );
  }
}
