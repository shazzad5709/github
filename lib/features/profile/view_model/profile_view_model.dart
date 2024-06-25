import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:githubdummy/core/base/view_model/base_view_model.dart';
import 'package:githubdummy/core/data/repo/login_controller.dart';
import 'package:githubdummy/core/di/locator.dart';
import 'package:githubdummy/core/services/auth/auth_service.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthService _authService = locator.get<AuthService>();

  CurrentUser? _user;
  CurrentUser? get user => _user;

  GitHub? _gitHub;
  GitHub? get gitHub => _gitHub;

  bool _isFetched = false;
  bool get isFetched => _isFetched;

  final LoginController loginController = locator.get<LoginController>();

  void _getAuthenticatedUser() {
    _user = _authService.user;
    _isFetched = true;
    notifyListeners();
  }

  Future<void> logout() async {
    _authService.logout().then((_) {
      loginController.loginController.value = false;
    }).catchError(
      (e) => print(e),
    );
  }

  @override
  Future<void> init() async {
    _getAuthenticatedUser();
  }
}
