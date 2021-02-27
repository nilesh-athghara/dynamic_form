//this file contains all our reducers
import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/models/screen_model.dart';
import 'package:dynamic_forms/redux/actions/middlewares_actions.dart';
import 'package:dynamic_forms/redux/actions/ui_actions.dart';
import 'package:dynamic_forms/redux/reducers/reducer.dart';
import 'package:redux/redux.dart';

Reducer<List<Field>> fieldReducer = combineReducers<List<Field>>([
  TypedReducer<List<Field>, ActionStoreFields>(storeFields),
]);

Reducer<double> heightReducer = combineReducers<double>(
    [TypedReducer<double, ActionStoreHeight>(storeHeight)]);

Reducer<double> widthReducer = combineReducers<double>(
    [TypedReducer<double, ActionStoreWidth>(storeWidth)]);

Reducer<ScreenModel> welcomeScreenReducer = combineReducers<ScreenModel>(
    [TypedReducer<ScreenModel, ActionStoreWelcomeScreen>(storeWelcomeScreenModel)]);

Reducer<ScreenModel> thankYouScreenReducer = combineReducers<ScreenModel>(
    [TypedReducer<ScreenModel, ActionStoreThankYouScreen>(storeThankYouScreenModel)]);
