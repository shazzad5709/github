import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github/shared/services/search/search_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/repository_error.dart';
import '../models/repository_ui_model.dart';

class SearchRepoViewModel extends ChangeNotifier {
  static const _pageSize = 30;
  final PagingController<int, RepositoryModel> _pagingController =
      PagingController(firstPageKey: 1);

  RepositoryModel? _selectedRepo;
  RepositoryModel? get selectedRepo => _selectedRepo;

  final SearchService _searchService = GetIt.instance<SearchService>();

  PagingController<int, RepositoryModel> get pagingController =>
      _pagingController;

  bool get loading => _pagingController.value.status != PagingStatus.completed;

  List<RepositoryModel> get repositories =>
      _pagingController.value.itemList ?? [];

  RepositoryError? get error =>
      _pagingController.value.error as RepositoryError?;

  SearchRepoViewModel() {
    _pagingController.addPageRequestListener((pageKey) {});
  }

  searchRepo(String query) {
    _pagingController.refresh();
    _getRepo(query, 1);
  }

  setSelectedRepo(RepositoryModel repo) => _selectedRepo = repo;

  _getRepo(String query, int pageKey) async {
    try {
      final response = await _searchService
          .search((pageKey == 1) ? query : '$query&page=$pageKey');
      if (response is List<RepositoryModel>) {
        final isLastPage = response.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(response);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(response, nextPageKey);
        }
      } else {
        _pagingController.error =
            RepositoryError(code: 500, message: response.toString());
      }
    } catch (e) {
      _pagingController.error =
          RepositoryError(code: 500, message: e.toString());
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
