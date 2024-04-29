import 'package:github/features/search_repositories/views/repository_details_screen.dart';
import 'package:github/features/search_repositories/views/search_repository_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) => const SearchRepoScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'repo_details',
            builder: (context, state) => const RepositoryDetailsScreen(),
          ),
        ]),
  ],
);
