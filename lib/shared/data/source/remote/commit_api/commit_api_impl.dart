import 'dart:convert';

import 'package:github/shared/data/models/response_models/commit_response_model.dart';

import '../../../../../network/http.dart';
import 'commit_api.dart';

class CommitApiImpl implements CommitApi {
  @override
  Future<Object> getCommits(
    String owner,
    String repo,
    String query,
  ) {
    return dio.get('/repos/$owner/$repo/commits?$query').then((response) {
      return response.data
          .map((commits) => commitResponseModelFromJson(jsonEncode(commits)))
          .toList() as Object;
    }).catchError((err) => err as Object);
  }
}
