import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/features/profile/views/profile_screen.dart';
import 'package:githubdummy/features/search_repositories/views/search_repository_screen.dart';
import 'package:githubdummy/widget_test_screen.dart';

class BottomNavConfig {
  BottomNavConfig._();

  static List<NavigationDestination> items = [
    // const BottomNavigationBarItem(
    //   icon: Icon(CupertinoIcons.home),
    //   backgroundColor: CupertinoColors.systemGrey,
    // ),
    const NavigationDestination(
      icon: Icon(CupertinoIcons.search),
      label: 'Search',
    ),
    const NavigationDestination(
      icon: Icon(CupertinoIcons.scope),
      label: 'Test',
    ),
    const NavigationDestination(
      icon: Icon(CupertinoIcons.profile_circled),
      label: 'Profile',
    ),
  ];

  // screens
  static Map<int, Widget> screens = {
    0: const SearchRepoScreen(),
    1: const WidgetTestScreen(),
    2: const ProfileScreenWithProvider(),
  };
}
