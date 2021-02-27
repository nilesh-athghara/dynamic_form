import 'package:dynamic_forms/constants/color.dart';
import 'package:dynamic_forms/models/field_model.dart';
import 'package:dynamic_forms/utils/text_feild_validators.dart';
import 'package:dynamic_forms/widgets/null_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FieldWidget extends StatefulWidget {
  final Field field;
  final Store store;
  final Function(dynamic) getData;
  FieldWidget(
      {@required this.store, @required this.field, @required this.getData})
      : super(key: UniqueKey());
  _FieldWidget createState() => _FieldWidget();
}

class _FieldWidget extends State<FieldWidget> {
  TextEditingController _controller = TextEditingController();
  dynamic data;

  @override
  Widget build(BuildContext context) {
    switch (widget.field.type) {
      case "short_text":
        {
          return boxContainer(
              child: TextFormField(
            controller: _controller,
            validator: (val) {
              if (widget.field.validations.required)
                return Validators.nullTextValidate(val);
              else
                return null;
            },
            onChanged: (val) {
              widget.getData(val);
            },
            decoration: InputDecoration(
                hintText: widget.field.title, border: InputBorder.none),
          ));
        }
      case "dropdown":
        {
          return boxContainer(
              child: DropdownButton<String>(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  hint: Text(widget.field.title),
                  value: data,
                  icon: Icon(
                    Icons.expand_more,
                    size: 40,
                  ),
                  autofocus: false,
                  isExpanded: true,
                  elevation: 1,
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  onChanged: (String newValue) {
                    widget.getData(newValue);
                    setState(() {
                      data = newValue;
                    });
                  },
                  items: widget.field.properties.choices
                      .map((e) => DropdownMenuItem(
                            child: Text(e.label),
                            value: e.label,
                          ))
                      .toList()));
        }
      case "number":
        {
          return boxContainer(
              child: TextFormField(
            onChanged: (val) {
              widget.getData(val);
            },
            validator: (val) {
              if (widget.field.validations.required)
                return Validators.nullTextValidate(val);
              else
                return null;
            },
            controller: _controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: widget.field.title, border: InputBorder.none),
          ));
        }
      case "email":
        {
          return boxContainer(
              child: TextFormField(
            onChanged: (val) {
              widget.getData(val);
            },
            validator: (val) {
              return Validators.emailValidate(
                  val, widget.field.validations.required);
            },
            controller: _controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: widget.field.title, border: InputBorder.none),
          ));
        }
      case "phone_number":
        {
          return boxContainer(
              child: TextFormField(
            controller: _controller,
            onChanged: (val) {
              widget.getData(val);
            },
            validator: (val) {
              return Validators.phoneNumberValidate(
                  val, widget.field.validations.required);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: widget.field.title, border: InputBorder.none),
          ));
        }
      case "rating":
        {
          return Container(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  Text(
                    widget.field.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: widget.field.properties.steps,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    onRatingUpdate: (rating) {
                      widget.getData(rating);
                      data = rating;
                    },
                  )
                ],
              ),
            ),
          );
        }
      case "date":
        {
          return boxContainer(
              child: InkWell(
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              final DateTime picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), // Refer step 1
                firstDate: DateTime(1990),
                lastDate: DateTime(2050),
              );
              if (picked != null && picked != data) widget.getData(picked);
              setState(() {
                data = picked;
              });
            },
            child: Container(
              height: 55,
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: ColorPalette.blackColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(data == null
                      ? widget.field.title
                      : "${data.month}/${data.day}/${data.year}")
                ],
              ),
            ),
          ));
        }
      case "yes_no":
        {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 6.0),
            child: Column(
              children: [
                Text(
                  widget.field.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      tapWidget("Yes", () {
                        setState(() {
                          data = "Yes";
                        });
                        widget.getData("Yes");
                      }),
                      tapWidget("No", () {
                        setState(() {
                          data = "No";
                        });
                        widget.getData("Yes");
                      })
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorPalette.blackColor, width: 0.5)),
                )
              ],
            ),
          );
        }
    }

    return nullContainer();
  }

  Widget tapWidget(String label, Function() onclick) {
    return Expanded(
      child: InkWell(
        child: Container(
          color: data == null || data != label
              ? Colors.white
              : data == "Yes"
                  ? ColorPalette.greenColor
                  : ColorPalette.redColor,
          alignment: Alignment.center,
          height: 30,
          child: Text(label),
        ),
        onTap: onclick,
      ),
    );
  }

  Container boxContainer({@required Widget child}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: child,
      decoration: BoxDecoration(
          border: Border.all(color: ColorPalette.blackColor, width: 0.5)),
    );
  }
}
