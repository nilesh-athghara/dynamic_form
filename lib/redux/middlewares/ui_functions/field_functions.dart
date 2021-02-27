import 'dart:convert';
import 'package:dynamic_forms/constants/api.dart';
import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/models/screen_model.dart';
import 'package:dynamic_forms/redux/actions/middlewares_actions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

class FieldApiCalls {
  static Future<bool> fetchFieldsData({@required Store store}) async {
    bool fetched = false;
    final String url =
        "${ApiUrls.baseUrl}/v0/b/collect-plus-6ccd0.appspot.com/o/mobile_tasks%2Fform_task.json?alt=media&token=d048a623-415e-41dd-ad28-8f77e6c546be";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      fetched = true;
      Map decoded = json.decode(response.body);
      ScreenModel welcomeScreen =
          screenModelFromJson(decoded["welcome_screens"][0]);
      ScreenModel thankYouScreen =
          screenModelFromJson(decoded["thankyou_screens"][0]);
      List<Field> fields = fieldFromJson(decoded["fields"]);
      store.dispatch(ActionStoreWelcomeScreen(welcomeScreen));
      store.dispatch(ActionStoreThankYouScreen(thankYouScreen));
      store.dispatch(ActionStoreFields(fields));
    }
    return fetched;
  }
}
