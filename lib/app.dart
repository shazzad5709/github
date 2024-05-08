import 'package:flutter/material.dart';
import 'package:github/config/router/router_config.dart';
import 'package:github/constants/text_strings.dart';
import 'package:provider/provider.dart';

import 'features/search_repositories/view_model/search_repository_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchRepoViewModel(),
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
