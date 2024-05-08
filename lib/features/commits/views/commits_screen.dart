import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/features/commits/models/commit_ui_model.dart';
import 'package:github/features/commits/view_model/commit_view_model.dart';
import 'package:github/features/commits/views/widgets/list_tile.dart';
import 'package:github/shared/di/locator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CommitScreenWithProvider extends StatelessWidget {
  const CommitScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator.get<CommitViewModel>(),
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
          'Commits',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
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
              'Failed to load commits',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text(
              'No relevant repositories found',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          firstPageProgressIndicatorBuilder: (context) => const Center(
            child: Text(
              'Find stuff...',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          newPageProgressIndicatorBuilder: (context) => const Center(
            child: CupertinoActivityIndicator(
              radius: 16,
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
