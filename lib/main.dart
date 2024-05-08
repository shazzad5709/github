import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github/shared/di/locator.dart';
import 'app.dart';
import './network/http.dart';

void main() {
  dio.interceptors.add(LogInterceptor());
  setupLocator();
  runApp(const App());
}
