import 'package:dynamic_forms/constants/color.dart';
import 'package:dynamic_forms/models/app_state.dart';
import 'package:dynamic_forms/models/screen_model.dart';
import 'package:dynamic_forms/screens/fields_screen.dart';
import 'package:dynamic_forms/utils/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ThankYouScreen extends StatefulWidget {
  final Store store;
  ThankYouScreen({@required this.store});
  _ThankYouScreen createState() => _ThankYouScreen();
}

class _ThankYouScreen extends State<ThankYouScreen> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (viewModel.thankYouScreenModel.properties.showButton)
                    TextButton(
                      onPressed: () {
                        Navigators.replace(
                            context, FieldsScreen(store: widget.store));
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          color: ColorPalette.blackColor,
                          child: Text(
                            viewModel.thankYouScreenModel.properties.buttonText,
                            style: TextStyle(
                                fontSize: 26, color: ColorPalette.whiteColor),
                          )),
                    ),
                  Icon(
                    Icons.share,
                    color: ColorPalette.blackColor,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget titleWidget(ViewModel viewModel) {
    return Text(
      viewModel.thankYouScreenModel.title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: viewModel.width / 20,
          fontWeight: FontWeight.bold,
          color: ColorPalette.blackColor),
    );
  }
}

class ViewModel {
  double height, width;
  ScreenModel thankYouScreenModel;
  ViewModel({this.width, this.height, this.thankYouScreenModel});
  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(
      thankYouScreenModel: store.state.thankYouScreen,
      width: store.state.width,
      height: store.state.height,
    );
  }
}
