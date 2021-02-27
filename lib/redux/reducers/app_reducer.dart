//this function connects our reducers to objects of our appState
import 'package:dynamic_forms/models/app_state.dart';
import 'package:dynamic_forms/redux/reducers/reducer_closures.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      fields: fieldReducer(state.fields, action),
      welcomeScreen: welcomeScreenReducer(state.welcomeScreen, action),
      thankYouScreen: thankYouScreenReducer(state.thankYouScreen, action),
      width: widthReducer(state.width, action),
      height: heightReducer(state.height, action));
}
