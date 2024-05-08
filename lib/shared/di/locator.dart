import 'package:get_it/get_it.dart';
import 'package:github/features/search_repositories/view_model/search_repository_view_model.dart';
import '../../features/commits/view_model/commit_view_model.dart';
import '../data/repo/selected_repo.dart';
import '../services/search/search_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SearchService());
  // register the SelectedRepoNotifier
  locator.registerLazySingleton(() => SelectedRepoNotifier());
  locator.registerFactory<SearchRepoViewModel>(() => SearchRepoViewModel());
  locator.registerFactory<CommitViewModel>(() => CommitViewModel());
}
