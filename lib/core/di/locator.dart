import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:githubdummy/constants/api_constant.dart';
import 'package:githubdummy/core/data/repo/login_controller.dart';
import 'package:githubdummy/core/services/auth/auth_service.dart';
import '../data/repo/selected_repo.dart';
import '../services/search/search_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SearchService());
  locator.registerLazySingleton(
    () => AuthService(),
  );
  locator.registerLazySingleton(() => SelectedRepoNotifier());
  locator.registerLazySingleton(() => LoginController());
}
