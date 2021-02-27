import 'package:dynamic_forms/models/app_state.dart';
import 'package:dynamic_forms/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_forms/redux/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //this stores our appState's instance at any given point of time
  // we can use data from this anywhere in our app
  final Store<AppState> store = Store<AppState>(appStateReducer,
      initialState: AppState.initialState(), middleware: []);
  runApp(MyApp(
    store: store,
  ));
}
