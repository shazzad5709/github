import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/search_repository_view_model.dart';
import 'widgets/repo_header.dart';

class RepositoryDetailsScreen extends StatelessWidget {
  const RepositoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchRepoViewModel repoViewModel = context.watch<SearchRepoViewModel>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RepoHeader(repo: repoViewModel.selectedRepo!),
            ],
          ),
        ));
  }
}
