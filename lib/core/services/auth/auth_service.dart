import 'dart:convert';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github/github.dart';
import 'package:githubdummy/constants/api_constant.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/core/data/repo/login_controller.dart';
import 'package:githubdummy/core/di/locator.dart';
import 'package:githubdummy/network/http.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/github_oauth2_client.dart';
import 'package:oauth2_client/oauth2_client.dart';

class AuthService {
  final LoginController loginController = locator.get<LoginController>();

  AuthService() {
    final prefs = GetStorage();
    final token = prefs.read(TextStrings.USER);
    if (token != null) {
      _accessToken = token;
      _gitHub = GitHub(auth: Authentication.withToken(_accessToken));
    }
    final userPref = prefs.read(TextStrings.USER);
    if (userPref != null) {
      _user = CurrentUser.fromJson(jsonDecode(userPref));
      loginController.loginController.value = true;
    }
  }

  CurrentUser? _user;
  CurrentUser? get user => _user;

  String _accessToken = '';
  String get accessToken => _accessToken;

  AccessTokenResponse? _tokenResponse;
  AccessTokenResponse? get tokenResponse => _tokenResponse;

  GitHub? _gitHub;
  GitHub? get gitHub => _gitHub;

  OAuth2Client ghClient = GitHubOAuth2Client(
    redirectUri: REDIRECT_URI,
    customUriScheme: 'demo',
  );

  Future<void> login() async {
    return ghClient
        .getTokenWithAuthCodeFlow(
      clientId: CLIENT_ID,
      clientSecret: SECRET,
    )
        .then((token) async {
      _tokenResponse = token;
      _accessToken = token.accessToken!;
      _gitHub = GitHub(auth: Authentication.withToken(_accessToken));
      _user = await _gitHub!.users.getCurrentUser();

      final prefs = GetStorage();
      prefs.write(TextStrings.ACCESS_TOKEN, _accessToken);
      print(prefs.read(TextStrings.ACCESS_TOKEN));
      prefs.write(TextStrings.USER, jsonEncode(_user!.toJson()));
      loginController.loginController.value = true;
    });
  }

  Future<void> logout() async {
    return ghClient.revokeAccessToken(_tokenResponse!).then((value) async {
      _tokenResponse = null;
      _accessToken = '';
      _user = null;
      _gitHub = null;
      loginController.loginController.value = false;
      final prefs = GetStorage();
      prefs.remove(TextStrings.ACCESS_TOKEN);
      prefs.remove(TextStrings.USER);
    });
  }

  // Future<Object> getUserDetails() {
  //   final headers = {
  //     'Authorization': 'Bearer $_accessToken',
  //   };
  //   dio
  //       .get(
  //     '$BASE_URL/user',
  //     options: Options(headers: headers),
  //   )
  //       .then((response) {
  //     if (response.statusCode == 200) {
  //       return jsonEncode(response.data);
  //     }
  //   });
  //   return Future.error('Failed to get user details');
  // }
}
