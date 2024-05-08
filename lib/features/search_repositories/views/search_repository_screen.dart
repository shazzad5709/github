import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/features/search_repositories/models/repository_ui_model.dart';
import 'package:github/features/search_repositories/view_model/search_repository_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../constants/route_paths.dart';
import 'widgets/list_tile.dart';
import 'widgets/search_bar.dart';

class SearchRepoScreen extends StatelessWidget {
  const SearchRepoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchRepoViewModel repoViewModel = context.watch<SearchRepoViewModel>();
    final TextEditingController _searchController = TextEditingController();
    final FocusNode _searchFocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _searchController.clear();
            },
            icon: const Icon(CupertinoIcons.xmark),
          ),
        ],
        leading: const Icon(CupertinoIcons.search),
        // backgroundColor: Colors.black,
        title: CSearchBar(
          searchController: _searchController,
          searchFocus: _searchFocus,
          repoViewModel: repoViewModel,
        ),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          _ui(repoViewModel),
        ],
      ),
    );
  }

  Widget _ui(SearchRepoViewModel repoViewModel) {
    return Expanded(
      child: PagedListView<int, RepositoryModel>(
        pagingController: repoViewModel.pagingController,
        builderDelegate: PagedChildBuilderDelegate<RepositoryModel>(
          itemBuilder: (context, item, index) {
            return CListTile(
              item: item,
              onTap: () {
                repoViewModel.setSelectedRepo(item);
                context.go('/${RoutePaths.repoDetails}');
              },
            );
          },
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: Text(repoViewModel.error?.message ?? 'No data found'),
          ),
          newPageErrorIndicatorBuilder: (context) => Center(
            child: Text(repoViewModel.error?.message ?? 'No data found'),
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
}
