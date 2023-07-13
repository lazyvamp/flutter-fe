import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class BgBackendClient {
  static const host = "http://10.0.2.2:8002";

  static const PAGE_FETCH_PATH = "/v1/page/fetch";
  static const PAGE_ACTION_PATH = "/v1/page/action";
  static const TIMEOUT = 5;

  static final BgBackendClient _singleton = BgBackendClient._internal();

  factory BgBackendClient() {
    return _singleton;
  }

  BgBackendClient._internal();

  Future<Response> pageAction(
      String actionId, Map<String, dynamic> data) async {
    String url = "$host$PAGE_ACTION_PATH";

    try {
      var payload = {"action_id": actionId, "data": data};
      print("payload: ");
      print(payload);
      Response response = await http
          .post(Uri.parse(url), body: json.encode(payload))
          .timeout(const Duration(seconds: TIMEOUT),
              onTimeout: () => http.Response('TimeOut', 408));

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> pageFetch(String pageId) async {
    String url = "$host$PAGE_FETCH_PATH?page_id=$pageId";

    try {
      Response response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: TIMEOUT),
          onTimeout: () => http.Response('TimeOut', 408));

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
