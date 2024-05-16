import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/config/router/router_config.dart';
import 'package:githubdummy/constants/api_constant.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/auth/view_model/auth_view_model.dart';
import 'package:githubdummy/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:githubdummy/shared/di/locator.dart';
import 'package:githubdummy/shared/services/auth/auth_service.dart';
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
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
