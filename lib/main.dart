import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:githubdummy/core/di/locator.dart';
import 'app.dart';
import './network/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  dio.interceptors.add(LogInterceptor());
  setupLocator();
  runApp(const App());
}
