import 'package:flutter/material.dart';
import 'package:githubdummy/constants/text_strings.dart';
import 'package:githubdummy/features/commits/models/commit_ui_model.dart';
import 'package:githubdummy/features/commits/view_model/commit_view_model.dart';
import 'package:githubdummy/features/commits/views/widgets/list_tile.dart';
import 'package:githubdummy/core/data/repo/commit_repo/commit_repo_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../core/data/source/remote/commit_api/commit_api_impl.dart';

class CommitScreenWithProvider extends StatelessWidget {
  const CommitScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommitViewModel(commitRepo: CommitRepoImpl(commitApi: CommitApiImpl())),
      child: const CommitScreen(),
    );
  }
}

class CommitScreen extends StatelessWidget {
  const CommitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommitViewModel commitViewModel = context.watch<CommitViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          TextStrings.commits,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Colors.black,
      body: PagedListView<int, CommitModel>(
        pagingController: commitViewModel.pagingController,
        builderDelegate: PagedChildBuilderDelegate<CommitModel>(
          itemBuilder: (context, commit, index) {
            return CommitListTile(
              message: commit.message ?? '',
              author: commit.author!.name ?? '',
              avatarUrl: commit.author!.avatarUrl ?? '',
              time: _formatTime(date: commit.committer!.date!),
              verified: commit.verification!.verified ?? false,
            );
          },
          newPageErrorIndicatorBuilder: (context) => const Center(
            child: Text(
              TextStrings.commitErrorIndicator,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text(
              TextStrings.commitNoItemsIndicator,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formatTime({required DateTime date}) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '${years}y';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}d';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}
