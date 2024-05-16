import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:githubdummy/features/auth/view_model/auth_view_model.dart';
import 'package:githubdummy/shared/data/repo/login_controller.dart';
import 'package:githubdummy/shared/di/locator.dart';
import 'package:githubdummy/shared/services/auth/auth_service.dart';

class ProfileViewModel extends ChangeNotifier {
  final AuthService _authService = locator.get<AuthService>();

  CurrentUser? _user;
  CurrentUser? get user => _user;

  GitHub? _gitHub;
  GitHub? get gitHub => _gitHub;

  bool _isFetched = false;
  bool get isFetched => _isFetched;

  ProfileViewModel() {
    _gitHub = _authService.gitHub;
    _getAuthenticatedUser();
  }

  final LoginController loginController = locator.get<LoginController>();

  void _getAuthenticatedUser() {
    _gitHub!.users.getCurrentUser().then((value) {
      _user = value;
      _isFetched = true;
      // print(jsonEncode(_user!.toJson()));
      notifyListeners();
    });
  }

  Future<void> logout() async {
    _authService.logout().then((_) {
      loginController.loginController.value = false;
    }).catchError(
      (e) => print(e),
    );
  }
}
