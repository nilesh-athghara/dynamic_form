import 'package:dynamic_forms/constants/color.dart';
import 'package:dynamic_forms/models/app_state.dart';
import 'package:dynamic_forms/models/screen_model.dart';
import 'package:dynamic_forms/screens/fields_screen.dart';
import 'package:dynamic_forms/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WelcomeScreen extends StatefulWidget {
  final Store store;
  WelcomeScreen({@required this.store});
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) {
      return ViewModel.create(store);
    }, builder: (BuildContext context, ViewModel viewModel) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(15.0),
          width: viewModel.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              titleWidget(viewModel),
              if (viewModel.welcomeScreen.properties.showButton)
                TextButton(
                  onPressed: () {
                    Navigators.push(context, FieldsScreen(store: widget.store));
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color: ColorPalette.blackColor,
                      child: Text(
                        viewModel.welcomeScreen.properties.buttonText,
                        style: TextStyle(
                            fontSize: 26, color: ColorPalette.whiteColor),
                      )),
                )
            ],
          ),
        ),
      );
    });
  }

  Widget titleWidget(ViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          viewModel.welcomeScreen.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: viewModel.width / 20,
              fontWeight: FontWeight.bold,
              color: ColorPalette.blackColor),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          viewModel.welcomeScreen.properties.description,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: viewModel.width / 26, color: ColorPalette.blackColor),
        )
      ],
    );
  }
}

class ViewModel {
  double height, width;
  ScreenModel welcomeScreen;
  ViewModel({this.width, this.height, this.welcomeScreen});
  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(
      welcomeScreen: store.state.welcomeScreen,
      width: store.state.width,
      height: store.state.height,
    );
  }
}
