abstract class CommitRepo {
  Future<Object> getCommits({
    String? query,
    required String owner,
    required String repo,
  });
}
