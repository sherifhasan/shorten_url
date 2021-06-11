import 'package:flutter/material.dart';

@immutable
class UrlResponse {
  final String code;
  final String mainUrl;
  final String shortUrl;
  bool isCopied = false;

  UrlResponse(
      {required this.code,
      required this.mainUrl,
      required this.shortUrl,
      this.isCopied = false});

  UrlResponse.fromJson(
    Map<String, dynamic> json,
  )   : code = json['result']['code'],
        shortUrl = json['result']['full_short_link'],
        mainUrl = json['result']['original_link'];

  Map<String, dynamic> toJson() => {
        'result': {
          'code': code,
          'full_short_link': shortUrl,
          'original_link': mainUrl
        }
      };
}
