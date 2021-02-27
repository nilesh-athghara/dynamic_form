import 'dart:convert';

List<Field> fieldFromJson(List str) => List<Field>.from(str.map((x) => Field.fromJson(x)));

String fieldToJson(List<Field> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Field {
  Field({
    this.id,
    this.title,
    this.validations,
    this.type,
    this.properties,
  });

  String id;
  String title;
  Validations validations;
  String type;
  Properties properties;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
    id: json["id"],
    title: json["title"],
    validations: Validations.fromJson(json["validations"]),
    type: json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "validations": validations.toJson(),
    "type": type,
    "properties": properties == null ? null : properties.toJson(),
  };
}

class Properties {
  Properties({
    this.alphabeticalOrder,
    this.choices,
    this.steps,
    this.shape,
    this.structure,
    this.separator,
  });

  bool alphabeticalOrder;
  List<Choice> choices;
  int steps;
  String shape;
  String structure;
  String separator;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    alphabeticalOrder: json["alphabetical_order"] == null ? null : json["alphabetical_order"],
    choices: json["choices"] == null ? null : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    steps: json["steps"] == null ? null : json["steps"],
    shape: json["shape"] == null ? null : json["shape"],
    structure: json["structure"] == null ? null : json["structure"],
    separator: json["separator"] == null ? null : json["separator"],
  );

  Map<String, dynamic> toJson() => {
    "alphabetical_order": alphabeticalOrder == null ? null : alphabeticalOrder,
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x.toJson())),
    "steps": steps == null ? null : steps,
    "shape": shape == null ? null : shape,
    "structure": structure == null ? null : structure,
    "separator": separator == null ? null : separator,
  };
}

class Choice {
  Choice({
    this.label,
  });

  String label;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
  };
}

class Validations {
  Validations({
    this.required,
  });

  bool required;

  factory Validations.fromJson(Map<String, dynamic> json) => Validations(
    required: json["required"],
  );

  Map<String, dynamic> toJson() => {
    "required": required,
  };
}
