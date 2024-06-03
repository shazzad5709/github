import 'package:flutter/material.dart';
import 'package:githubdummy/features/search_repositories/models/repository_ui_model.dart';

class SelectedRepoNotifier extends ChangeNotifier {
  RepositoryModel _selectedRepo = RepositoryModel();

  RepositoryModel get selectedRepo => _selectedRepo;

  void setSelectedRepo(RepositoryModel repo) {
    _selectedRepo = repo;
    notifyListeners();
  }
}
