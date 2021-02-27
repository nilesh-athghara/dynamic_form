import 'package:dynamic_forms/constants/color.dart';
import 'package:dynamic_forms/models/app_state.dart';
import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/screens/thank_you_screen.dart';
import 'package:dynamic_forms/utils/navigators.dart';
import 'package:dynamic_forms/utils/toast.dart';
import 'package:dynamic_forms/widgets/field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FieldsScreen extends StatefulWidget {
  final Store store;
  FieldsScreen({@required this.store});
  _FieldsScreen createState() => _FieldsScreen();
}

class _FieldsScreen extends State<FieldsScreen> {
  Map<String, dynamic> data = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          appBar: appbar(),
          body: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(15),
                      itemCount: viewModel.fields.length,
                      itemBuilder: (BuildContext context, int index) {
                        Field field = viewModel.fields[index];
                        return FieldWidget(
                          getData: (val) {
                            data[field.id] = val;
                          },
                          store: widget.store,
                          field: field,
                        );
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        bool validated = validateOtherFields(viewModel);
                        if (validated) {
                          //print data along with field id.
                          print(data.toString());
                          Navigators.replace(
                              context, ThankYouScreen(store: widget.store));
                        }
                      }
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        color: ColorPalette.blackColor,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 26, color: ColorPalette.whiteColor),
                        )),
                  ),
                ],
              ),
            ),
          ));
    });
  }

  AppBar appbar() {
    return AppBar(
      title: Text(
        "Survey",
        style: TextStyle(color: ColorPalette.blackColor),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: ColorPalette.whiteColor,
    );
  }

  bool validateOtherFields(ViewModel viewModel) {
    for (Field e in viewModel.fields) {
      if ((e.type == "dropdown" ||
              e.type == "rating" ||
              e.type == "date" ||
              e.type == "yes_no") &&
          e.validations.required &&
          (data[e.id] == "" || data[e.id] == null)) {
        showToast("${e.title}");
        return false;
      }
    }
    return true;
  }
}

class ViewModel {
  double height, width;
  List<Field> fields;
  ViewModel({this.width, this.height, this.fields});
  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(
      fields: store.state.fields,
      width: store.state.width,
      height: store.state.height,
    );
  }
}
