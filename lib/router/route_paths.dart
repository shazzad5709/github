part of 'router_config.dart';

class AppRoute {
  AppRoute._();

  static const String home = 'home';
  static const String repoDetails = 'repo-details';
  static const String commits = 'commits';
  static const String login = 'login';
  static const String bottomNav = 'bottom-nav';
  static const String splash = 'splash';
  static const String test = 'test';
}

class _RoutePaths {
  _RoutePaths._();

  static const String initial = splash;
  static const String home = '/${AppRoute.home}';
  static const String repoDetails = '/${AppRoute.repoDetails}';
  static const String commits = '/${AppRoute.commits}';
  static const String login = '/${AppRoute.login}';
  static const String splash = '/${AppRoute.splash}';
  static const String test = '/${AppRoute.test}';
}
