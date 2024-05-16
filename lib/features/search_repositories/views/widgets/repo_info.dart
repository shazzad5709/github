import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/search_repositories/view_model/search_repository_view_model.dart';
import 'package:githubdummy/features/search_repositories/views/widgets/info_row.dart';
import 'package:provider/provider.dart';

import '../../models/repository_ui_model.dart';

class RepoInfo extends StatelessWidget {
  const RepoInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchRepoViewModel repoViewModel = context.watch<SearchRepoViewModel>();
    RepositoryModel repo = repoViewModel.selectedRepo!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          InfoRow(
            title: TextStrings.issues,
            value: repo.openIssues.toString(),
            icon: CupertinoIcons.dot_square,
            iconColor: Colors.green,
          ),
          const SizedBox(height: 8),
          InfoRow(
            title: TextStrings.forks,
            value: _formatCount(repo.forksCount!),
            icon: CupertinoIcons.command,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 8),
          InfoRow(
            title: TextStrings.watchers,
            value: _formatCount(repo.watchersCount!),
            icon: CupertinoIcons.eye_fill,
            iconColor: Colors.orange,
          ),
          const SizedBox(height: 8),
          InfoRow(
            title: TextStrings.license,
            value: repo.license?.spdxId ?? 'None',
            icon: CupertinoIcons.book_fill,
            iconColor: Colors.orange,
          ),
          const SizedBox(height: 8),
          _branch(repo),
        ],
      ),
    );
  }

  Row _branch(RepositoryModel repo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.ideographic,
      children: [
        Row(
          textBaseline: TextBaseline.ideographic,
          children: [
            const Icon(
              CupertinoIcons.arrow_branch,
              color: Colors.white60,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              repo.defaultBranch ?? '',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white60,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.check,
              color: Colors.green,
            )
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  _formatCount(int count) =>
      count > 1000 ? '${(count / 1000).toStringAsFixed(1)}k' : count.toString();
}
