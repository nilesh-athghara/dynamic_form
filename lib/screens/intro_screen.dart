import 'package:dynamic_forms/constants/color.dart';
import 'package:dynamic_forms/constants/string.dart';
import 'package:dynamic_forms/redux/actions/ui_actions.dart';
import 'package:dynamic_forms/redux/middlewares/ui_functions/field_functions.dart';
import 'package:dynamic_forms/screens/welcome_screen.dart';
import 'package:dynamic_forms/utils/navigators.dart';
import 'package:dynamic_forms/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class IntroScreen extends StatefulWidget {
  final Store store;
  IntroScreen({@required this.store});
  _IntroScreen createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  double height;
  double width;
  bool errorLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    bool fetched = await FieldApiCalls.fetchFieldsData(store: widget.store);
    if (fetched) {
      Navigators.pushAndRemoveUntil(
          context, WelcomeScreen(store: widget.store));
    } else {
      setState(() {
        errorLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.whiteColor,
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              UiStrings.introTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.blackColor,
                  fontSize: width / 18),
            ),
            SizedBox(
              height: 30,
            ),
            errorLoading
                ? Text(
                    UiStrings.errorLoading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorPalette.blackColor, fontSize: width / 22),
                  )
                : loader()
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    widget.store.dispatch(ActionStoreWidth(width));
    widget.store.dispatch(ActionStoreHeight(height));
  }
}
