import 'dart:async';

import 'package:flutter/material.dart';
import 'package:githubdummy/core/data/repo/login_controller.dart';
import 'package:githubdummy/core/di/locator.dart';
import 'package:githubdummy/core/services/auth/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
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
}
