import 'package:flutter/material.dart';

class Navigators {
  static void pushAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
