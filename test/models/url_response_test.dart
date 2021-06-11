import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_url/core/models/url_response.dart';

void main() {
  test('Mapping shorten url api to json', () {
    final urlResponse = UrlResponse(
        code: 'wnytbo',
        mainUrl: 'https://www.google.com/',
        shortUrl: 'https://shrtco.de/wnytbo');
    final jsonMap = urlResponse.toJson();
    expect(jsonMap['result']['code'], urlResponse.code);
    expect(jsonMap['result']['full_short_link'], urlResponse.shortUrl);
    expect(jsonMap['result']['original_link'], urlResponse.mainUrl);
  });
  test('Mapping shorten url api from json', () {
    final jsonMap = Map<String, dynamic>.from({
      'result': {
        'code': 'wnytbo',
        'full_short_link': 'https://shrtco.de/wnytbo',
        'original_link': 'https://www.google.com/'
      }
    });
    final urlResponse = UrlResponse.fromJson(jsonMap);
    expect(urlResponse.code, jsonMap['result']['code']);
    expect(urlResponse.shortUrl, jsonMap['result']['full_short_link']);
    expect(urlResponse.mainUrl, jsonMap['result']['original_link']);
  });
}
