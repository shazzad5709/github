// To parse this JSON data, do
// final repositoryModel = repositoryModelFromJson(jsonString);

import 'dart:convert';

CommitModel commitModelFromJson(String str) =>
    CommitModel.fromJson(json.decode(str));

String commitModelToJson(CommitModel data) => json.encode(data.toJson());

class CommitModel {
  CommitAuthor? author;
  CommitAuthor? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  CommitModel({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  factory CommitModel.fromJson(Map<String, dynamic> json) => CommitModel(
        author: json["author"] == null
            ? null
            : CommitAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: json["tree"] == null ? null : Tree.fromJson(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: json["verification"] == null
            ? null
            : Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "committer": committer?.toJson(),
        "message": message,
        "tree": tree?.toJson(),
        "url": url,
        "comment_count": commentCount,
        "verification": verification?.toJson(),
      };
}

class CommitAuthor {
  String? name;
  String? email;
  DateTime? date;
  String? avatarUrl;

  CommitAuthor({
    this.name,
    this.email,
    this.date,
    this.avatarUrl,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date?.toIso8601String(),
      };
}

class Tree {
  String? sha;
  String? url;

  Tree({
    this.sha,
    this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}

class Verification {
  bool? verified;
  String? reason;
  String? signature;
  String? payload;

  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}
