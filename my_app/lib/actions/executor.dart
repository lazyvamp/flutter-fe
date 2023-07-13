import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/clients/bg_backend_client.dart';
import 'package:my_app/pages/page_builder_v2.dart';
import 'dart:convert';
import '../models/actions.dart';

class ActionExecutor {
  static Future<Map> execute(Action action, {dynamic data}) {
    switch (action.type) {
      case ActionType.PAGE_FETCH:
        return PageFetchActionExecutor().execute(action);
      case ActionType.PAGE_ACTION:
        return PageActionExecutor().execute(action, data);
      case ActionType.API:
        // TODO: Handle this case.
        break;
    }
    print(action.type);
    throw Exception("Invalid Action found");
  }
}

class PageActionExecutor {
  Future<Map> execute(Action action, dynamic data) async {
    http.Response response =
        await BgBackendClient().pageAction(action.params['id'], data);

    print(response.body);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      if (isPageResponse(body)) {
        print("Loading new page");
        Get.to(() => PageBuilderV2(body['data']),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 500));
      }
      return Future(() => {});
    }

    if (response.statusCode == 400) {
      var body = json.decode(response.body);
      return Future(() => body);
    }

    throw Exception("Something went wrong");
  }

  bool isPageResponse(Map<String, dynamic> response) {
    if (response['data'] == null) {
      return false;
    }

    if (response['data']['widgets'] != null) {
      return true;
    }

    return false;
  }
}

class PageFetchActionExecutor {
  Future<Map> execute(Action action) async {
    http.Response response =
        await BgBackendClient().pageFetch(action.params['id']);

    if (response.statusCode == 200) {
      print("2xx response from backend");
      var body = json.decode(response.body);
      var pageData = body['data'];
      Get.to(() => PageBuilderV2(pageData),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 500),
          routeName: pageData['meta']['page_id']);
      print("code is here");
    }

    throw Exception("Something went wrong");
  }
}
