import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class PageProvider extends ChangeNotifier {
  static const apiEndpoint = 'http://10.0.2.2:8002/v1/page/fetch?page_id=';

  bool isLoading = true;
  String error = '';
  late Map<String, dynamic> body;

  init() {
    print("flushing all data");
    isLoading = true;
    error = '';
    body = {};
  }

  fetchPage(String page) async {
    String url = apiEndpoint + page;

    try {
      print("before http call for page: " + page);
      init();
      Response response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 5),
          onTimeout: () => http.Response('Error', 408));

      print(response.statusCode);
      if (response.statusCode == 200) {
        body = json.decode(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    print("error: " + error);
    isLoading = false;
    notifyListeners();
  }
}
