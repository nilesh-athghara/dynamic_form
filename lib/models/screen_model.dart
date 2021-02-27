import 'dart:convert';

ScreenModel screenModelFromJson(Map str) => ScreenModel.fromJson(str);

String screenModelToJson(ScreenModel data) => json.encode(data.toJson());

class ScreenModel {
  ScreenModel({
    this.title,
    this.properties,
  });

  String title;
  Properties properties;

  factory ScreenModel.fromJson(Map<String, dynamic> json) => ScreenModel(
    title: json["title"],
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "properties": properties.toJson(),
  };
}

class Properties {
  Properties({
    this.showButton,
    this.description,
    this.buttonText,
  });

  bool showButton;
  String description;
  String buttonText;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    showButton: json["show_button"],
    description: json["description"],
    buttonText: json["button_text"],
  );

  Map<String, dynamic> toJson() => {
    "show_button": showButton,
    "description": description,
    "button_text": buttonText,
  };
}
