import '../../source/remote/commit_api.dart';

class CommitRepo {
  CommitRepo();

  Future<Object> getCommits({
    String? query,
    required String owner,
    required String repo,
  }) {
    return CommitApi().getCommits(owner, repo, query ?? '').then((commits) {
      return commits;
    });
  }
}
