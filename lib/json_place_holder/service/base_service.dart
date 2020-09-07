import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/base_model.dart';

class BaseService {
  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<dynamic> get<T extends IBaseModel>(String path, {IBaseModel model}) async {
    final response = await http.get("$baseUrl/$path");

    switch (response.statusCode) {
      case HttpStatus.ok:
        return _jsonBodyParser<T>(model, response.body);
      default:
        throw response.body;
    }
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, String body) {
    final jsonBody = jsonDecode(body);

    if (jsonBody is List) {
      return jsonBody.map((e) => model.fromJson(e)).toList().cast<T>();
    } else if (jsonBody is Map) {
      return model.fromJson(jsonBody);
    } else {
      return jsonBody;
    }
  }
}
