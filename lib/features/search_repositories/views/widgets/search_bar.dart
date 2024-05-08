import 'package:flutter/material.dart';
import 'package:github/constants/text_strings.dart';
import '../../view_model/search_repository_view_model.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    super.key,
    required TextEditingController searchController,
    required FocusNode searchFocus,
    required this.repoViewModel,
  })  : _searchController = searchController,
        _searchFocus = searchFocus;

  final TextEditingController _searchController;
  final FocusNode _searchFocus;
  final SearchRepoViewModel repoViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocus,
          onSubmitted: (value) {
            repoViewModel.searchRepo(value);
            _searchFocus.unfocus();
          },
          decoration: const InputDecoration(
            hintText: TextStrings.searchBarHint,
            // border only bottom
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
    );
  }
}
