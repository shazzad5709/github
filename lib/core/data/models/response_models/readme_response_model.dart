// To parse this JSON data, do
//
//     final readmeResponseModel = readmeResponseModelFromJson(jsonString);

import 'dart:convert';

ReadmeResponseModel readmeResponseModelFromJson(String str) => ReadmeResponseModel.fromJson(json.decode(str));

String readmeResponseModelToJson(ReadmeResponseModel data) => json.encode(data.toJson());

class ReadmeResponseModel {
    String? name;
    String? path;
    String? sha;
    int? size;
    String? url;
    String? htmlUrl;
    String? gitUrl;
    String? downloadUrl;
    String? type;
    String? content;
    String? encoding;
    Links? links;

    ReadmeResponseModel({
        this.name,
        this.path,
        this.sha,
        this.size,
        this.url,
        this.htmlUrl,
        this.gitUrl,
        this.downloadUrl,
        this.type,
        this.content,
        this.encoding,
        this.links,
    });

    factory ReadmeResponseModel.fromJson(Map<String, dynamic> json) => ReadmeResponseModel(
        name: json["name"],
        path: json["path"],
        sha: json["sha"],
        size: json["size"],
        url: json["url"],
        htmlUrl: json["html_url"],
        gitUrl: json["git_url"],
        downloadUrl: json["download_url"],
        type: json["type"],
        content: json["content"],
        encoding: json["encoding"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "path": path,
        "sha": sha,
        "size": size,
        "url": url,
        "html_url": htmlUrl,
        "git_url": gitUrl,
        "download_url": downloadUrl,
        "type": type,
        "content": content,
        "encoding": encoding,
        "_links": links?.toJson(),
    };
}

class Links {
    String? self;
    String? git;
    String? html;

    Links({
        this.self,
        this.git,
        this.html,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        git: json["git"],
        html: json["html"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "git": git,
        "html": html,
    };
}
