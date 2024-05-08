import 'package:github/constants/route_paths.dart';
import 'package:github/features/commits/views/commits_screen.dart';
import 'package:github/features/search_repositories/views/repository_details_screen.dart';
import 'package:github/features/search_repositories/views/search_repository_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const SearchRepoScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: RoutePaths.repoDetails,
          builder: (context, state) => const RepositoryDetailsScreen(),
        ),
        GoRoute(
          path: RoutePaths.commits,
          builder: (context, state) => const CommitScreenWithProvider(),
        ),
      ],
    ),
  ],
);
