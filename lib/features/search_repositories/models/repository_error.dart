import 'dart:convert';

RepositoryError repoErrorFromJson(String str) =>
    RepositoryError.fromJson(json.decode(str));

String repoErrorToJson(RepositoryError data) => json.encode(data.toJson());

class RepositoryError {
  RepositoryError({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory RepositoryError.fromJson(Map<String, dynamic> json) =>
      RepositoryError(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
