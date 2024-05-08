import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github/features/search_repositories/models/repository_ui_model.dart';
import 'package:github/shared/data/repo/commit_repo/commit_repo.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../shared/data/repo/selected_repo.dart';
import '../models/commit_ui_model.dart';

class CommitViewModel extends ChangeNotifier {
  static const _pageSize = 30;
  final PagingController<int, CommitModel> _pagingController =
      PagingController(firstPageKey: 1);

  PagingController<int, CommitModel> get pagingController => _pagingController;

  final RepositoryModel selectedRepo =
      GetIt.instance<SelectedRepoNotifier>().selectedRepo;

  // CommitModel? _selectedCommit;
  // CommitModel? get selectedCommit => _selectedCommit;

  bool get loading => _pagingController.value.status != PagingStatus.completed;

  List<CommitModel> get commits => _pagingController.value.itemList ?? [];

  CommitViewModel() {
    _pagingController.addPageRequestListener((pageKey) {});
    _getCommits(1);
  }

  _getCommits(int pageKey) {
    CommitRepo()
        .getCommits(
            query: (pageKey == 1) ? '' : '&page=$pageKey',
            owner: selectedRepo.owner!.login ?? '',
            repo: selectedRepo.name ?? '')
        .then((commits) {
      if (commits is List) {
        final commitModels = _convertResponse(commits);

        final isLastPage = commitModels.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(commitModels);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(commitModels, nextPageKey);
        }
      }
    }).catchError((err) {
      _pagingController.error = err;
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  List<CommitModel> _convertResponse(List<dynamic> commits) {
    return commits.map((e) {
      final commit = commitModelFromJson(jsonEncode(e.commit));
      commit.author!.avatarUrl = e.author.avatarUrl;
      return commit;
    }).toList();
  }
}
