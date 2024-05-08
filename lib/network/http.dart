import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://api.github.com',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
  headers: {
    'Accept': 'application/vnd.github+json',
  },
));
