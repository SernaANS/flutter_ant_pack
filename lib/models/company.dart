// To parse this JSON data, do
//
//     final company = companyFromMap(jsonString);

import 'dart:convert';

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"] == null ? null : json["name"],
        catchPhrase: json["catchPhrase"] == null ? null : json["catchPhrase"],
        bs: json["bs"] == null ? null : json["bs"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "catchPhrase": catchPhrase == null ? null : catchPhrase,
        "bs": bs == null ? null : bs,
      };
}
