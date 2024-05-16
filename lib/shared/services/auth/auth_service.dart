import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:github/github.dart';
import 'package:githubdummy/constants/api_constant.dart';
import 'package:githubdummy/network/http.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/github_oauth2_client.dart';
import 'package:oauth2_client/oauth2_client.dart';

class AuthService {
  UserProfile? _user;

  AuthService();
  UserProfile? get user => _user;

  String _accessToken = '';
  String get accessToken => _accessToken;

  AccessTokenResponse? _tokenResponse;
  AccessTokenResponse? get tokenResponse => _tokenResponse;

  Credentials? _credentials;
  Credentials? get credentials => _credentials;

  // final Auth0 auth0;

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
        .then((token) {
      print(token.accessToken);
      _tokenResponse = token;
      _accessToken = token.accessToken!;
      _gitHub = GitHub(auth: Authentication.withToken(_accessToken));
    });
  }

  Future<void> logout() async {
    return ghClient.revokeAccessToken(_tokenResponse!).then((value) {
      _tokenResponse = null;
      _accessToken = '';
      _gitHub = null;
    });
  }

  Future<Object> getUserDetails() {
    final headers = {
      'Authorization': 'Bearer $_accessToken',
    };
    dio
        .get(
      '$BASE_URL/user',
      options: Options(headers: headers),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return jsonEncode(response.data);
      }
    });
    return Future.error('Failed to get user details');
  }
}
