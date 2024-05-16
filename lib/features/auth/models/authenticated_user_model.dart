class AuthenticatedUser {
  final String username;
  final String avatarUrl;
  final String accessToken;

  AuthenticatedUser({
    required this.username,
    required this.avatarUrl,
    required this.accessToken,
  });

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) {
    return AuthenticatedUser(
      username: json['login'],
      avatarUrl: json['avatar_url'],
      accessToken: json['access_token'],
    );
  }
}
