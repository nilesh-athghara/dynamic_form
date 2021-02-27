//this file contains blueprints of all our reducers
import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/models/screen_model.dart';
import 'package:dynamic_forms/redux/actions/middlewares_actions.dart';
import 'package:dynamic_forms/redux/actions/ui_actions.dart';

List<Field> storeFields(List<Field> products, ActionStoreFields action) {
  return action.fields;
}

double storeHeight(double height, ActionStoreHeight action) {
  return action.height;
}

double storeWidth(double width, ActionStoreWidth action) {
  return action.width;
}

ScreenModel storeWelcomeScreenModel(
    ScreenModel screenModel, ActionStoreWelcomeScreen action) {
  return action.screenModel;
}

ScreenModel storeThankYouScreenModel(
    ScreenModel screenModel, ActionStoreThankYouScreen action) {
  return action.screenModel;
}
