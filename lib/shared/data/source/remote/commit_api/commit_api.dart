abstract class CommitApi {
  Future<Object> getCommits(
    String owner,
    String repo,
    String query,
  );
}
