import 'package:get_it/get_it.dart';
import '../data/repo/selected_repo.dart';
import '../services/search/search_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SearchService());
  locator.registerLazySingleton(() => SelectedRepoNotifier());
}
