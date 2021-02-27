import 'package:dynamic_forms/models/app_state.dart';
import 'package:dynamic_forms/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyApp extends StatefulWidget {
  final Store store;
  MyApp({
    @required this.store,
  });
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          title: 'Dynamic Forms',
          debugShowCheckedModeBanner: false,
          home: IntroScreen(store: widget.store,),
        ));
  }
}
