import 'package:githubdummy/shared/data/repo/commit_repo/commit_repo.dart';
import '../../source/remote/commit_api/commit_api.dart';

class CommitRepoImpl implements CommitRepo {
  CommitRepoImpl({required this.commitApi});

  final CommitApi commitApi;

  @override
  Future<Object> getCommits({
    String? query,
    required String owner,
    required String repo,
  }) {
    return commitApi.getCommits(owner, repo, query ?? '').then((commits) {
      return commits;
    });
  }
}
