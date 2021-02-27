//this class represents the overall data state of our application
import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/models/screen_model.dart';

class AppState {
  final double height;
  final double width;
  final ScreenModel welcomeScreen;
  final ScreenModel thankYouScreen;
  final List<Field> fields;
  const AppState(
      {this.height,
      this.width,
      this.fields,
      this.thankYouScreen,
      this.welcomeScreen});
  factory AppState.initialState() {
    return AppState(
        height: 0,
        width: 0,
        fields: [],
        thankYouScreen: null,
        welcomeScreen: null);
  }

  //helper methods for local storage(if needed)
  static AppState fromJson(dynamic json) {
    if (json == null) return null;
    return AppState();
  }

  dynamic toJson() => {};
}
