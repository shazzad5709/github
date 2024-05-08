import 'package:flutter/material.dart';
import 'package:github/config/router/router_config.dart';
import 'package:github/features/search_repositories/view_model/search_repository_view_model.dart';
import 'package:github/shared/di/locator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => locator.get<SearchRepoViewModel>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Github',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
