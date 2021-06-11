import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shorten_url/core/models/url_response.dart';

class LinksHistoryProvider with ChangeNotifier {
  final List<UrlResponse> _urlsHistoryList = [];

  UnmodifiableListView<UrlResponse> get urlsHistoryList =>
      UnmodifiableListView(_urlsHistoryList);

  void add(UrlResponse response) {
    _urlsHistoryList.add(response);
    notifyListeners();
  }

  void remove(String code) {
    for (var i = 0; i < _urlsHistoryList.length; i++) {
      if (_urlsHistoryList[i].code == code) {
        _urlsHistoryList.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  void copied(String code) {
    int index = -1;
    for (var i = 0; i < _urlsHistoryList.length; i++) {
      if (_urlsHistoryList[i].code == code) {
        _urlsHistoryList[i].isCopied = true;
        index = i;
        break;
      }
      unCopy(index);
      notifyListeners();
    }
  }

  void unCopy(int index) {
    for (var i = 0; i < _urlsHistoryList.length; i++) {
      if (i == index) {
        continue;
      } else {
        _urlsHistoryList[i].isCopied = false;
      }
    }
  }

  void clearList() {
    _urlsHistoryList.clear();
    notifyListeners();
  }
}
