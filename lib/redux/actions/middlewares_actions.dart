//this file contains action blueprints responsible for causing a change in appstate through middlewares

import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/models/screen_model.dart';

class ActionStoreFields {
  final List<Field> fields;
  ActionStoreFields(this.fields);
}

class ActionStoreWelcomeScreen {
  final ScreenModel screenModel;
  ActionStoreWelcomeScreen(this.screenModel);
}
class ActionStoreThankYouScreen {
  final ScreenModel screenModel;
  ActionStoreThankYouScreen(this.screenModel);
}
