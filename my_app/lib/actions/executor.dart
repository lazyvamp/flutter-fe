import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/clients/bg_backend_client.dart';
import 'package:my_app/pages/page_builder_v2.dart';
import 'dart:convert';
import '../models/actions.dart';

class ActionExecutor {
  static Future<Map> execute(Action action) {
    switch (action.type) {
      case ActionType.PAGE_FETCH:
        return PageFetchActionExecutor().execute(action);
      case ActionType.PAGE_ACTION:
        // TODO: Handle this case.
        break;
      case ActionType.API:
        // TODO: Handle this case.
        break;
    }
    print(action.type);
    throw Exception("Invalid Action found");
  }
}

class PageFetchActionExecutor {
  Future<Map> execute(Action action) async {
    http.Response response =
        await BgBackendClient().pageFetch(action.params['id']);

    if (response.statusCode == 200) {
      print("2xx response from backend");
      var body = json.decode(response.body);
      Get.to(() => PageBuilderV2(body['data']),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 500));
      print("code is here");
    }

    throw Exception("Something went wrong");
  }
}
