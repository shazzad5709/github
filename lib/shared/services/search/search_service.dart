import 'dart:convert';

import 'package:github/constants/api_constant.dart';
import 'package:github/features/search_repositories/models/repository_ui_model.dart';
import 'package:github/shared/models/response_models/search_repository_response_model.dart';
import 'package:github/utils/exceptions/error.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<Object> search(String query) async {
    try {
      final uri = '$baseUrl/search/repositories?q=$query';
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final searchResponse = searchResponseModelFromJson(response.body);

        return searchResponse.items
            .map((e) => repositoryModelFromJson(jsonEncode(e)))
            .toList();
      } else {
        return 'Failed to load data';
      }
    } on Exception catch (e) {
      return ErrorResponse(
        code: 500,
        message: e.toString(),
      );
    }
  }
}
