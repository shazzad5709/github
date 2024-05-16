import 'package:get_it/get_it.dart';
import 'package:githubdummy/config/router/bottom_nav_config.dart';
import 'package:githubdummy/features/auth/view_model/auth_view_model.dart';
import 'package:githubdummy/features/auth/views/login_screen.dart';
import 'package:githubdummy/features/bottom_nav/views/bottom_nav_widget.dart';
import 'package:githubdummy/features/commits/views/commits_screen.dart';
import 'package:githubdummy/features/search_repositories/views/repository_details_screen.dart';
import 'package:githubdummy/features/search_repositories/views/search_repository_screen.dart';
import 'package:githubdummy/shared/services/auth/auth_service.dart';
import 'package:go_router/go_router.dart';

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
        return LoginScreen();
      },
      onExit: (context, state) {
        final locator = GetIt.instance;
        locator.unregister<AuthViewModel>();
        return Future.value(true);
      },
    ),
    GoRoute(
      path: _RoutePaths.home,
      name: AppRoute.home,
      builder: (context, state) =>
          BottomNavigationWidget(items: BottomNavConfig.items, screens: BottomNavConfig.screens),
    ),
    GoRoute(
      path: _RoutePaths.repoDetails,
      name: AppRoute.repoDetails,
      builder: (context, state) => const RepositoryDetailsScreen(),
    ),
    GoRoute(
      path: _RoutePaths.commits,
      name: AppRoute.commits,
      builder: (context, state) => const CommitScreenWithProvider(),
    ),
    // GoRoute(
    //   path: _RoutePaths.bottomNav,
    //   name: AppRoute.bottomNav,
    //   builder: (context, state) => const BottomNavigationWidget(items: items, screens: screens),
    // ),
  ],
);
