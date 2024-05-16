part of 'router_config.dart';

class AppRoute {
  AppRoute._();

  static const String home = 'home';
  static const String repoDetails = 'repo-details';
  static const String commits = 'commits';
  static const String login = 'login';
  static const String bottomNav = 'bottom-nav';
}

class _RoutePaths {
  _RoutePaths._();

  static const String initial = login;
  static const String home = '/${AppRoute.home}';
  static const String repoDetails = '/${AppRoute.repoDetails}';
  static const String commits = '/${AppRoute.commits}';
  static const String login = '/${AppRoute.login}';
  static const String bottomNav = '/${AppRoute.bottomNav}';
}
