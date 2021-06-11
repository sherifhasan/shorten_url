import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shorten_url/core/models/url_response.dart';

class ShortenApi {
  Future<UrlResponse?> shortenUrl(String shortenUrl) async {
    final client = Dio();
    final url = 'https://api.shrtco.de/v2/shorten?url=$shortenUrl';
    try {
      final response = await client.get(url,
          options: Options(responseType: ResponseType.bytes));
      if (response.statusMessage == "Created") {
        return compute(parseResponse, response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } on DioError catch (error) {
      print(error);
    } finally {
      client.clear();
    }
    return null;
  }
}

UrlResponse parseResponse(response) {
  return UrlResponse.fromJson(json.decode(utf8.decode(response)));
}
