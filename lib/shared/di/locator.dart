import 'package:get_it/get_it.dart';
import 'package:github/features/search_repositories/view_model/search_repository_view_model.dart';
import '../services/search/search_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SearchService());
  locator.registerFactory<SearchRepoViewModel>(() => SearchRepoViewModel());
}