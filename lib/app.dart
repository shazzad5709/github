import 'package:flutter/material.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/config/themes/theme.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/auth/view_model/auth_view_model.dart';
import 'package:githubdummy/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:githubdummy/core/di/locator.dart';
import 'package:githubdummy/core/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:githubdummy/features/search_repositories/view_model/search_repository_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchRepoViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(
            locator.get<AuthService>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: TextStrings.appName,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
