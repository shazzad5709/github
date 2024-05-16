import 'dart:async';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:githubdummy/features/auth/models/authenticated_user_model.dart';
import 'package:githubdummy/shared/data/repo/login_controller.dart';
import 'package:githubdummy/shared/di/locator.dart';
import 'package:githubdummy/shared/services/auth/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  AuthenticatedUser? _authenticatedUser;
  AuthenticatedUser? get authenticatedUser => _authenticatedUser;

  // final GoRouter router;

  CurrentUser? _user;
  CurrentUser? get user => _user;

  Credentials? _credentials;
  Credentials? get credentials => _credentials;

  // final Auth0 auth0;

  bool isAuthenticated = false;

  final LoginController loginController = locator.get<LoginController>();

  final AuthService authService;

  AuthViewModel(this.authService);

  Future<void> login() async {
    authService.login().then((_) {
      if (authService.tokenResponse != null) {
        loginController.loginController.value = true;
      }
    }).catchError(
      (e) => print(e),
    );
  }

  // Future<void> logout() async {
  //   return authService.logout().then((_) {
  //     notifyListeners();
  //   }).catchError(
  //     (e) => print(e),
  //   );
  // }
}
