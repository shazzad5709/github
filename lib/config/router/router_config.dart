import 'package:get_it/get_it.dart';
import 'package:githubdummy/config/router/bottom_nav_config.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/auth/view_model/auth_view_model.dart';
import 'package:githubdummy/features/auth/views/login_screen.dart';
import 'package:githubdummy/features/bottom_nav/views/bottom_nav_widget.dart';
import 'package:githubdummy/features/commits/views/commits_screen.dart';
import 'package:githubdummy/features/profile/view_model/profile_view_model.dart';
import 'package:githubdummy/features/search_repositories/views/repository_details_screen.dart';
import 'package:githubdummy/core/services/auth/auth_service.dart';
import 'package:githubdummy/widget_test_screen.dart';
import 'package:githubdummy/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: _RoutePaths.initial,
  routes: <RouteBase>[
    GoRoute(
      path: _RoutePaths.login,
      name: AppRoute.login,
      builder: (context, state) {
        final locator = GetIt.instance;
        if (!locator.isRegistered<AuthViewModel>()) {
          locator.registerFactory(() => AuthViewModel(locator.get<AuthService>()));
        }
        return const LoginScreen();
      },
      onExit: (context, state) {
        final locator = GetIt.instance;
        locator.unregister<AuthViewModel>();
        return Future.value(true);
      },
    ),
    // GoRoute(
    //   path: _RoutePaths.test,
    //   name: AppRoute.test,
    //   builder: (context, state) => const WidgetTestScreen(),
    // ),
    GoRoute(
      path: _RoutePaths.home,
      name: AppRoute.home,
      builder: (context, state) {
        final locator = GetIt.instance;
        if (!locator.isRegistered<ProfileViewModel>()) {
          locator.registerFactory(() => ProfileViewModel());
        }
        return BottomNavigationWidget(
            items: BottomNavConfig.items, screens: BottomNavConfig.screens);
      },
      onExit: (context, state) {
        final locator = GetIt.instance;
        locator.unregister<ProfileViewModel>();
        return Future.value(true);
      },
    ),
    GoRoute(
      path: _RoutePaths.repoDetails,
      name: AppRoute.repoDetails,
      builder: (context, state) => const RepositoryDetailsScreen(),
    ),
    GoRoute(
      path: _RoutePaths.splash,
      name: AppRoute.splash,
      builder: (context, state) => const SplashScreen(),
      onExit: (context, state) {
        return Future.value(true);
      },
    ),
    GoRoute(
      path: _RoutePaths.commits,
      name: AppRoute.commits,
      builder: (context, state) => const CommitScreenWithProvider(),
    ),
  ],
);

// Future<String?> _getInitialLocation() async {
//   final prefs = await SharedPreferences.getInstance();
//   final accessToken = prefs.getString(TextStrings.ACCESS_TOKEN);
//   return accessToken != null ? _RoutePaths.home : _RoutePaths.login;
// }
